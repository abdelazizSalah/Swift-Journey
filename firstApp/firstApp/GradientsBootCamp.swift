//
//  GradientsBootCamp.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//

import SwiftUI
/*
    
 */


struct GradientsBootCamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(
                /// Linear Gradient
//                LinearGradient(
//                    colors: [Color.red, Color.orange, Color.blue],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
                
                /// Radial Gradient
                /// This gradient in form of circles.
//                RadialGradient(
//                    colors: [Color.red, Color.orange, Color.purple],
//                    center: .center,
//                    startRadius: 0,
//                    endRadius: 120)
                
                /// Angular Gradient
                /// This makes angels
                AngularGradient(
                    colors: [Color.blue, Color.red],
                    center: .center,
                    angle: .degrees(90 + 90)
                )
            ) // end of fill.
            .frame(width: 400, height:350)
            
    }
}

#Preview {
    GradientsBootCamp()
}
