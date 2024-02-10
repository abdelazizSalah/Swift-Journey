//
//  SpacerBootCamp.swift
//  firstApp
//
//  Created by zizo on 10/02/2024.
//

/*(
    Spacers are mainly used to put spaces between objects,
 It takes it size dynamically by default, and it pushes objects to the end of the screen.
 
 If we placed objects between two spacers, then the objects will be centered.
 
 They have a minimum length, it is 8 by default, but usually we set it to 0, so if there is no space, they should disappear.
 */


import SwiftUI

struct SpacerBootCamp: View {
    var body: some View {
        VStack
        {
            HStack(spacing:0){
    //            Spacer( minLength: 8)
    //                .frame(height: 10)
    //                .background(Color.red)
    //            Rectangle()
    //                .frame(width: 50
    //                    , height: 50)
    //
    //            Spacer(minLength: 8)
    //                .frame(height: 10)
    //                .background(Color.red)
    //
    //            Rectangle()
    //                .fill(Color.green)
    //                .frame(width: 50
    //                       , height: 50)
    //
    //            Spacer(minLength: 0)
    //                .frame(height: 10)
    //                .background(Color.red)
    //            Rectangle()
    //                .fill(Color.yellow)
    //                .frame(width: 50
    //                       , height: 50)
    //            Spacer(minLength: 0)
    //               .frame(height: 10)
    //               .background(Color.red)
    //
    //
                Image(systemName: "xmark")
                    .frame(width: 50, height: 50)
                    
                Spacer()
                    .frame(height: 20)
                    .background(Color.red)
                
                Image(systemName: "gear")
                    .frame(width: 50, height: 50)
                    
            }.font(.title) /// if we want to make all the children of the hstack to share the same property, we set it here, it works for a lot of properties, such as color, font and so on.
                .background(Color.yellow)
                .padding(.horizontal, 40)
                .padding(.top, 50)
    //        .padding(.horizontal, 200) // here, due to high padding, the right, and center spacers will disappear, because we set their minimum length to 0, so if there is not enough spaces, they would disappear.
            .background(Color.blue)
            Spacer() // this is how we can push objects to the top of the screen.
                .frame(width:20)
                .background(Color.green)
        
        } // the end of VStack
        .background(Color.gray)
        
        Rectangle()
            .fill(Color.yellow)
            
        } // the end of the View
        
}

#Preview {
    SpacerBootCamp()
}
