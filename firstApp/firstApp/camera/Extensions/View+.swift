//
//  View+.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import SwiftUI



extension View {
    func fullScreenCamera(isPresented: Binding<Bool>, imageData: Binding<Data?>) -> some View {
        self.fullScreenCover(isPresented: isPresented, content: {
            CameraView(imageData: imageData, showCamera: isPresented)
        })
    }
}
