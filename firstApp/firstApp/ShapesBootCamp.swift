//
//  ShapesBootCamp.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//
/*
    Here we are going to talk about shapes, so they are useful to help us in determining the shape of the UI objects, whethere we want them to be circular, rectangular, etc...
 
 1. .trim() must be before the .stroke()
 */

import SwiftUI

struct ShapesBootCamp: View {
    var body: some View {
        /// Circle
        Circle()
//            .trim(from: 0.2, to:1.0) // this cut the shape, this gets from / to percent of the shape, ie: from 0.1 to 1, gives you 90%, usually this is used in reloding or progress indicators.
        
//            .fill(Color.orange)  this is how we change the color.
//            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//            .stroke(Color.blue) // this focus on the frame of the shape.
//            .stroke(Color.red, lineWidth: 20) // this determine the color, and the width of the frame.
            .stroke(Color.red, style: StrokeStyle(
        lineWidth: 20,
        lineCap: .butt,
        dash:[40]
            ))
//            .stroke(Color.red, style: StrokeStyle(
//                // using StrokeStyle, we can customize the style of the stroke
//                lineWidth: 20,
//                lineCap: .square, // the shape of the dash, whethere it is rounded, butt, or square.
//                dash: [1] // as you increase the value, the size of the dash increase, and the number of dashes decrease.
//                
//            ))
        
            .frame(width: 200, height: 300)
        /// Ellipse
        /// same properties as we have discussed, in the circle
        Ellipse()
            .stroke(
                style: StrokeStyle(
            lineWidth: 20,
            lineCap: .butt,
            dash:[20]
            )
            )
            .fill(Color.yellow) // must come before frame.
            .frame(width: 200,height:150) // and so on
            
        /// Rectangle
        Rectangle()
            .fill(Color.green)
            
            .frame(width: 300, height: 140)
        
        /// Rounded Rectangle
        RoundedRectangle(cornerRadius: 200)
            .trim(from:0.3, to: 1.0)
            .frame(width: 300)
    }
}

#Preview {
    ShapesBootCamp()
}
