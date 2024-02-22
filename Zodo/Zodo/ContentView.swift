//
//  ContentView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

/*
 
    We are going to implement a todo application using MVVM model which stands for
    Model - data model.
    View - UI.
    View Model architecture - manages Models for View.
 
 the View here stands for every thing which is related to the UI of the application, and usually this is the first step in any application.
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
