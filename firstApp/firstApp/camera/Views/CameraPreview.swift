//
//  CameraPreview.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import AVFoundation
import SwiftUI

struct CameraPreview: UIViewRepresentable {
    @Binding var cameraVM: CameraViewModel
    let frame: CGRect
    
    func makeUIView(context: Context) -> UIView {
        let view = UIViewType(frame: frame)
        cameraVM.preview = AVCaptureVideoPreviewLayer  (session: cameraVM.session)
        cameraVM.preview.frame = frame
        cameraVM.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(cameraVM.preview)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        cameraVM.preview.frame = frame
        guard let connection = cameraVM.preview.connection else { print("can not generate connection"); return }
        cameraVM.preview.connection?.videoRotationAngle = UIDevice.current.orientation.videoRotationAngle
    }
}
