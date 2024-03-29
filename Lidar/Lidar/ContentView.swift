//
//  ContentView.swift
//  Lidar
//
//  Created by zizo on 15/02/2024.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    @State private var distance: Float = 0.0
    var body: some View {
        ZStack() {
            ARViewContanier(distance: $distance)
                .ignoresSafeArea(.all)
            
            VStack() {
                Spacer( )
                Text("Distance : \(String (format: "%.2f", distance)) meters")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .padding(.bottom, 100)
            }
        }
    }
}


/// what is the UIViewRepresentable?
struct ARViewContanier: UIViewRepresentable {
    @Binding var distance: Float
    func makeUIView (context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.environmentTexturing = .automatic
        
        arView.session.delegate = context.coordinator
        arView.session.run(config)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> ARSessionDelegateCoordinator {
        return ARSessionDelegateCoordinator(distance: $distance)
    }
}


/// what is the NSObject, ARSessionDelegate
/// when to use ARSessionDelegate?
class ARSessionDelegateCoordinator: NSObject, ARSessionDelegate {
    @Binding var distance: Float
    init(distance: Binding<Float>) {
        /// why we add _
        /// what is the difference between Binding<Float> and Normal Float?
        _distance = distance
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        guard let currentPointCloud = frame.rawFeaturePoints else {return}
        let cameraTransform = frame.camera.transform
        var closestDistance: Float = Float.greatestFiniteMagnitude
        
        for point in currentPointCloud.points {
            let pointInCameraSpace = cameraTransform.inverse * simd_float4(point, 1)
            let distanceToCamera =  sqrt (
                    pointInCameraSpace.x * pointInCameraSpace.x +
                    pointInCameraSpace.y * pointInCameraSpace.y +
                    pointInCameraSpace.z * pointInCameraSpace.z)
            
            if distanceToCamera < closestDistance {
                closestDistance = distanceToCamera
            }
        }
        distance = closestDistance
    }
}


#Preview {
    ContentView()
}
