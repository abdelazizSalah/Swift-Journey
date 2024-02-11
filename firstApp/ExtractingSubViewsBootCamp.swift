//
//  ExtractingSubViewsBootCamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

/*
     Usually when we have a part of the screen which may change, and has dynamic data, usually we create a separe view for it, and call it inside our main view
 
 */

import SwiftUI

struct ExtractingSubViewsBootCamp: View {
    var body: some View {
        ZStack() {
            /// background
            Color.mint
                .ignoresSafeArea()
            
            /// content
            contentLayer 
            
        }
    }
    
    var contentLayer: some View {
        HStack { /// Tu7fa !
            MyItemSubView(title: "Mangos", count: 5, color: Color.orange)
            MyItemSubView(title: "Apples", count: 12, color: Color.red)
            MyItemSubView(title: "Bananas", count: 120, color: Color.yellow)
        } // now it looks way nicer and net. :D
    }
}

struct MyItemSubView: View {
    let title: String
    let count: Int
    let color: Color
    var body: some View {
        VStack(spacing: 10) {
            Text ("\(count)")
                .font(.title)
                .bold()
            
            Text (title)
                .font(.subheadline)
                .bold()
        }
        .padding(.all, 20)
        .background(color)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.4) ,radius: 10, x: 10, y: 10)
    }
}


#Preview {
    ExtractingSubViewsBootCamp()
}
