//
//  ObjectSavingScreen.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import SwiftUI

struct ObjectSavingScreen: View {
    @State private var imageData: Data? = nil
    @State private var showCamera: Bool = false
 
    var body: some View {
        VStack(spacing:20) {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            
            Button("Take photo") {
                showCamera = true
            }
            .padding()
        }
        .padding()
        .fullScreenCamera(isPresented: $showCamera, imageData: $imageData)
    }
        
}


#Preview {
    ObjectSavingScreen()
}
