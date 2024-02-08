//
//  BackgroundAndOverLayBootcamp.swift
//  firstApp
//
//  Created by zizo on 08/02/2024.
//

/*
    Overlay is similar to the foreground.
    
    In the .background() method, so far we have only used the color, however, we can use any other widget as a background, we can use images, shapes, anything actually.
 */

import SwiftUI

struct BackgroundAndOverLayBootcamp: View {
    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300, alignment: .center)
//            .background(
////                LinearGradient(
////                    colors: [Color.red, Color.green, Color.blue],
////                    startPoint: .leading,
////                    endPoint: .trailing) // this is how we can add Liear gradients on the background.
//                Circle()
//                    .fill(Color.green)
//            )
//            .frame(width: 400, height: 400, alignment: .center) // el t7t lazm el size bta3u yeb2a akbur mn el fo2, 34an yban, 8aleban hyb2a feh stack, wlakn e3rf dol for now.
//            .background(
//                    Circle()
//                        .fill(Color.red)
//            )
        
        /// now lets talk somehow about overlays
//        RoundedRectangle(cornerRadius: 40)
//            .fill(Color.red)
//            .frame(width: 200, height: 200, alignment: .center)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            ) .background(
//                Circle()
//                    .  fill(Color.yellow)
//                    .frame(width: 300, height: 300)
//            ) // this is how we can build circle contains a rounded rectangle.
        
        /// now lets build the same shape in the video .
//        Rectangle()
//            .frame(width:100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(width: 50, height: 50)
//                ,
//                    
//                alignment: .topLeading)
//            .background(
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150), alignment: .bottomTrailing // el alignment lazm yeb2a bara msh gowa.
//            )
        
        /// What about creating a notification circle with icon?
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .frame(width: 100, height: 100)
            .background(
                Circle()
                    .fill(
                        LinearGradient(colors: [Color("NotificationColor"), Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .shadow(color: Color("shadowColor"), radius: 10, x:0, y:10)
            ).overlay(
                Circle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("5")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                    )
                    .shadow(color:Color("shadowColor") ,radius: 20, x: 10, y: 10)
                
                ,alignment: .bottomTrailing
            )
    }
}

#Preview {
    BackgroundAndOverLayBootcamp()
}
