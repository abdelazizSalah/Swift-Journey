//
//  ExtractingFunctionsAndViewsFromBodyBootCamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

/*
 Extracting Functions, and Views from the body, makes the code more cleaner, and facilitate reading that code.
 
 */
import SwiftUI

struct ExtractingFunctionsAndViewsFromBodyBootCamp: View {
    
    @State var backGroundColor: Color = Color.yellow
    
    var body: some View {
        ZStack() {
            /// background
            backGroundColor
                .ignoresSafeArea()
            
            /// content
            contentView /// this is how to extract the view outside the main view body.
        }
    }
    
    
   func changeBackGroundColor () {
       self.backGroundColor = Color.indigo
    }
    
    var contentView: some View {
        VStack(spacing: 20) {
            Text ("Title")
                .font(.largeTitle)
            Button(
                action: changeBackGroundColor, /// this is how we can create a function outside the actual view.
                label: {
                    Text("Press Me".uppercased()).padding()
                        .bold()
                        .font(.title3)
                        .padding(.horizontal, 10)
                        .background(Color.black)
                        .foregroundStyle(Color.white)
                        .cornerRadius(20)
                }
            )
            
        }
    }
    
}

#Preview {
    ExtractingFunctionsAndViewsFromBodyBootCamp()
}
