//
//  imagePicker.swift
//  webSockets
//
//  Created by zizo on 25/02/2024.
//

import SwiftUI

struct imagePicker: View {
    /// this is the name of the image in the assets
    let imageName = "imageTrial"
    var body: some View {
        VStack() {
            /// lets show the image
            Image(imageName)
            
            /// try to access the png data of the
            /// There are two main methods here
            ///     1. .jpegData
            ///         This method produces a JPEG image which is (Joint photographic experts group) which is a compressed image format commonly used for photographs and complex images, it supports lossy compressions, which means that some image quality may be sacrificed, to achieve smaller file sizes, we can do so by specifing the compressionQuality, it varies from 0.0 to 1.0.
            ///         0 -> very low  quality.
            ///         1 -> very high quality.
            ///     2. ,.pngData
            ///         This method produces png image (portable network graphics), it is lossless, which means that it retains all image data and quality without sacrifing anything, it is often used for imaged that require high quality and transparency.
            ///     UIImage is the class which is responsible for dealing with images, and from it we can get the binary representation.
            if let imageBinary = UIImage(named: imageName)?.jpegData(compressionQuality: 1.0) {
                /// this gets the hexaRepresentation of the image.
                /// if we want to have the binary representation we can look for how can we do so. 
                let hexString = imageBinary.map { String(format: "%02x", $0)}.joined()
                 Text(hexString)
                
                /// this is how we can get the image back from binary representation into image -> most probably I will not need to use it, however, it is good to know it.
                if let imageData = dataFromHexDecimalString(hexString),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                }
            } else {
                 Text("Image not found")
            }
               
        }
    }
    
    /// this is how we can get the image back from binary representation into image.
    func dataFromHexDecimalString (_ string: String) -> Data? {
        var data = Data(capacity: string.count / 2)
        var index = string.startIndex
        while index < string.endIndex {
            let byteString = string[index ..< string.index(index, offsetBy: 2)]
            if var byte = UInt8(byteString, radix: 16) {
                data.append(&byte, count: 1)
            } else {
                return nil
            }
            index = string.index(index, offsetBy: 2)
        }
        return data
    }
}


#Preview {
    imagePicker()
}
