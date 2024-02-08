//
//  ColorsBootCamp.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//

/*
     Now we will learn how to use colors rather than those of the basic colors come with the SwiftUI library.
 
 1. .primary -> it will be black, if the device mode is light mode, while it will be white, in the dark mode.
 
 2.
 
 */

import SwiftUI
import UIKit
struct ColorsBootCamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color.primary
//                Color()
//                Color.blue
//                Color(red: 0.52, green: 0.11, blue: 0.29)
//                Color(UIColor.secondarySystemBackground)
                Color("NewCustomColor") // you will find this "CustomColor" in the assets folder, so you can play with it as you wish.
            )
            .frame(width:300, height: 500)
            .shadow(color: Color("NewCustomColor").opacity(0.7),radius: 30, x: 20.30, y:10.30)
            
    }
}

#Preview {
    ColorsBootCamp()
}
