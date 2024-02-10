//
//  FramesBootcamp.swift
//  firstApp
//
//  Created by zizo on 08/02/2024.
//
/*
    This may be the most important file in the Whole course.
 in this file we will learn how to align objects on the screen, and this is where most of the people stuck.
 
    Every Single object on the screen has a frame by default. and the frame is just a simple rectangle on the screen with certain width and height.
 
    They are transparent, and we can not see them, so we need to debug it, and understand how does they work.
 
    The most important argument is the *alignment argument* , because it define where exactly we should insert the element in the screen.
 
    Usually the min parameter, must perceed the max parameter.
 
 */

import SwiftUI

struct FramesBootcamp: View {
    var body: some View {
//        Text("Hello, World!, Hello again")
//            .frame(width: 300, height: 200) // we can stack frames
//            .background(Color(.blue))
//            .frame(
//                minWidth: 40/*This is the minimum allowed width*/,
//                maxWidth: 400,
//                minHeight: 50, // Minimum allowed height.
//                idealHeight: 0.7,
//                maxHeight: .infinity, // This makes the frame as big as possible, it will leave a space for the headers and footers.
//                alignment: .center // center by default.
//            )
////            .frame(width: 300, height: 300, alignment: .center)
//            .background(Color(.red))
//            
////            .frame(width: 300, height: 300, alignment: .center)  The effect of this will be different than the above.
//            
        
        /// Now lets play
        Text ("Lets Play")
            .background(Color.green)
            .frame(height: 300 ,alignment: .bottomLeading)
            .background(Color.red)
            .frame(width: 300, height: 200, alignment: .bottomTrailing)
            .background(Color.black)
            .frame(width: .infinity, height: 500, alignment: .center)
            .background(Color.gray)
            .frame(width: 400, height: 700, alignment: .bottomTrailing)
            .background(Color.cyan)
    }
}

#Preview {
    FramesBootcamp()
}
