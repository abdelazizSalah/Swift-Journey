//
//  ContentView.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Zizo Is Creating the first Application on the iphone device :D")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
            Button("This is a button.") {
                
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    ContentView()
}
