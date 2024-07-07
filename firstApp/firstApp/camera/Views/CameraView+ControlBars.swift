//
//  CameraView+ControlBars.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import Foundation
import SwiftUI

extension CameraView {
    @ViewBuilder
    /// vertical Views
    var verticalControlBar: some View {
        if VM.hasPhoto {
            verticalControlBarPostPhoto
        } else {
            verticalControlBarPrePhoto
        }
    }
    
    var verticalControlBarPrePhoto: some View {
        VStack {
            Spacer()
                .frame(height: controlButtonWidth)
            Spacer()
            photoCaptureButton
            Spacer()
            cancelButton
                .frame(height: controlButtonWidth)
        }
    }
    var verticalControlBarPostPhoto: some View {
        VStack {
            usePhotoButton
                .frame(height: controlButtonWidth)
            Spacer()
            retakeButton
                .frame(height: controlButtonWidth)
        }
    }
    
    
    /// Horizontal views
    @ViewBuilder
      var horizontalControlBar: some View {
          if VM.hasPhoto {
              horizontalControlBarPostPhoto
          } else {
              horizontalControlBarPrePhoto
          }
    }
      var horizontalControlBarPrePhoto: some View {
        HStack {
            cancelButton
                .frame(width: controlButtonWidth)
            Spacer()
            photoCaptureButton
            Spacer()
            Spacer()
                .frame(width: controlButtonWidth)
        }
    }
      var horizontalControlBarPostPhoto: some View {
        HStack {
           retakeButton
                .frame(width: controlButtonWidth)
            Spacer()
           usePhotoButton
                .frame(width: controlButtonWidth)
            
        }
    }
    
}


#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
