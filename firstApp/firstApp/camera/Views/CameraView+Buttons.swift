//
//  CameraView+Buttons.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import Foundation
import SwiftUI

extension CameraView {
    
       var cancelButton: some View {
         ControlButtonView(label: "Cancel") {
             showCamera = false
         }
    }
    
       var photoCaptureButton: some View {
         Button {
             VM.takePhoto()
         } label: {
             ZStack{
                 Circle()
                     .fill(.white)
                     .frame(width: 65)
                 Circle()
                     .stroke(.white, lineWidth: 3)
                     .frame(width: 75)
             }
         }
    }
    
    
      var retakeButton: some View {
        ControlButtonView(label: "Retake") {
            VM.retakePhoto()
        }
   }
   
     
      var usePhotoButton: some View {
        ControlButtonView(label: "Use photo") {
            imageData = VM.photoData
            showCamera = false
        }
   }
   
    
}


#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
