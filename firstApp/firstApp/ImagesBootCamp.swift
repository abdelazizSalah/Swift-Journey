//
//  ImagesBootCamp.swift
//  firstApp
//
//  Created by zizo on 08/02/2024.
//

import SwiftUI

/*
    Side Note, to make the image able to change its color, on uploading it to the assets folder, we should click on it, then open the settings on the top right of the window, then change the Render Mode, from Default, to Template image
 
    And whenever we want to change the color, just change the forground color to the color you want.
 
 */
struct ImagesBootCamp: View {
    var body: some View {
//        Image("Abdelaziz")
//            .resizable()
////            .scaledToFit()
//            .scaledToFill()
//            .frame(width:300, height: 500)
////            .clipped() // usually we use .clipped with .fill
////            .cornerRadius(400)  this allow us to have a corner edges. and usually the radius is half of either the height or the width, to make a circle, we can either set height and width to the same value, and then set the corner radius to any value, or we can use the .clipShaped, where the shapes come to play.
//            .clipShape(
//                RoundedRectangle(cornerRadius: 40)
////                Circle()
////                Ellipse()
//            )
//
        /// Now lets see how to use it as an Icon.
        Image("GooglePng")
            .renderingMode(.template) // this is how we can change the color of any icon or image, to work, we must get the photo as png, with transparent background.
            .resizable()
            .scaledToFit()
            .foregroundColor(.green)
//            .foregroundColor(Color(white: 0.5))
    }
}
    
#Preview {
    ImagesBootCamp()
}
