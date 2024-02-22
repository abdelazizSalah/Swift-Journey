//
//  AddView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct AddView: View {
    @State var note:String = ""
    var body: some View {
        ScrollView () {
            VStack() {
                TextField("Add Your Note Here ...", text: $note)
                    .padding()
                    .frame(height: 55)
                    .background(.gray)
                    .cornerRadius(10)
            } .padding()
            
            Button(
                action: {
                    /// TODO: Later we should add what is written inside the text field in our data.
                },
                label: {
                    Text("Save".uppercased())
                }
            ) /// end of the button
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .font(.headline)
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    NavigationView () {
        AddView()
            .navigationTitle("Add an item ✒️")
    }
}
