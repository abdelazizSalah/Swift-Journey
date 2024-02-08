//
//  VStack,HStacks,And_ZStacks.swift
//  firstApp
//
//  Created by zizo on 08/02/2024.
//

/*
    In this file we will learn how to use builtIn stacks.
 There are 3 types of stacks
    1. HStack -> Horizontal Stacks
    2. VStack -> Vertical Stacks
    3. ZStack -> Depth Stach -> front to back stacks

     Some basics about the stacks

 1. It comes with default padding and margin between its children, and we can control this using the spacing parameter, and it is 8 by default, so we can remove the spacing by setting its value to 0, and it is possible to give it a -ve values.
 2. ZStack has no spacing.
 3. we can use ZStack instead of using background and overlay.
 4. for simple things, like 2 or 3 objects, use background, while if the screen is becoming complex, use ZStack better, as it easier.
 */

import SwiftUI

struct VStack_HStacks_And_ZStacks: View {
    var body: some View {
        /// so this is how we can built a Horizontal stack
//        HStack(
//            spacing: 20,
//            content: {
//            Rectangle().fill(Color.red)
//                .frame(width: 100, height: 100)
//            Rectangle().fill(Color.yellow)
//                .frame(width: 100, height: 100)
//            Rectangle().fill(Color.green)
//                .frame(width: 100, height: 100)
//        })
//        
//        /// so this is how we can built a vertical stack
//        VStack(
//            alignment: .leading,
//            spacing: 0,
//            content: {
//            Rectangle().fill(Color.red)
//                .frame(width: 200, height: 100)
//            Rectangle().fill(Color.yellow)
//                .frame(width: 150, height: 100)
//            Rectangle().fill(Color.green)
//                .frame(width: 100, height: 100)
//        })
//       
//        /// so this is how we can built a depth stack
//        ZStack(
//            alignment: .bottomTrailing,
//            content: {
//            Rectangle().fill(Color.red)
//                .frame(width: 150, height: 100)
//            Rectangle().fill(Color.yellow)
//                .frame(width: 125, height: 80)
//            Rectangle().fill(Color.green)
//                .frame(width: 90, height: 60)
//        })
//        
        /// lets  try to stacks into anotherStacks.
        ZStack(alignment: .top){
            
            Rectangle()
                .fill(Color("shadowColor"))
            
            VStack(spacing: 20){
                HStack(spacing: 0){
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 109, height: 150).padding()
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 120, height: 150).padding()
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 120, height: 150).padding()
                }.background(Color.white)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                
                VStack(spacing:0){
                    Text("5").font(.system(size: 40)).bold().foregroundColor(.white)
                    Text("Items in your Cart").font(.title).foregroundColor(.white)
                }
                
                /// this is how to build a circle contains a number with Zstack
                ZStack(){
                    Circle()
                        .fill(Color.orange).frame(width: 100, height: 100)
                    Text("5").foregroundColor(.white).bold().font(.title)
                }
                /// and this is how to build a circle contains a number with backfgrounds.
                Text("5").foregroundColor(.white)
                    .bold()
                    .font(.title)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .background(Circle().fill(Color.orange))
                
            }.background(Color.black)
            
        }
    }
}

#Preview {
    VStack_HStacks_And_ZStacks()
}
