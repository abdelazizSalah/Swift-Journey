//
//  SafeAreasBootCamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

/*
 Anything that the user can interact with -see, interact, or touch- , must exist in the safeArea.
 
 Elements by default are inserted away from the safe area, however, we can ignore the safe areas, using
 .edgesIgnoreSafeArea(direction) -> deprecated
 .ignoresSafeArea()
 but this is a bad practice.
 */

import SwiftUI

struct SafeAreasBootCamp: View {
    var body: some View {
//        ZStack() {
//            // background
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//            
//            // foreground
//            VStack(){
//                Text("Hello, World!")
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red) // I belive that, background by default ignore the safeArea.
//        }

        /// lets implement the video example.
        ScrollView(){
            VStack(alignment: .leading) {
                Text("Title Goes here")
                    .font(.largeTitle)
                    .bold()
                
                ForEach(0..<10){ index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        } .background(Color.red.ignoresSafeArea())
        
    }
}

#Preview {
    SafeAreasBootCamp()
}
