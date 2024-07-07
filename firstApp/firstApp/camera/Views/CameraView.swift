//
//  CameraView.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import SwiftUI

struct CameraView: View {
    
    @Environment (\.verticalSizeClass) var vertiSizeClass
    
    @State internal var VM:CameraViewModel = CameraViewModel()
    @Binding  var imageData: Data?
    @Binding  var showCamera: Bool 
    let controlButtonWidth: CGFloat = 120
    let controlButtonHeight: CGFloat = 90
    var isLandScape:Bool { vertiSizeClass == .compact }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    
                    cameraPreview
                    if isLandScape {
                        verticalControlBar
                            .frame(width: controlButtonWidth)
                    }
                }
                if !isLandScape {
                    horizontalControlBar
                        .frame(height: controlButtonHeight)
                }
            }
        }
    }
    
    private var cameraPreview: some View {
        GeometryReader { geo in
            CameraPreview(cameraVM: $VM, frame: geo.frame(in: .global))
                .onAppear() {
                    VM.requestAccessAndSetup()
                }
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
