//
//  TextEditorsBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

/*
    This is similar to TextField, but with multiple lines.
 */

import SwiftUI

struct TextEditorsBootCamp: View {
    @State var TextEditorString: String = "This is a placeholder for now!"
    var body: some View {
        NavigationView() {
            VStack() {
                TextEditor(text: $TextEditorString)
                    .font(.headline)
                    .foregroundStyle(Color.yellow)
                    .frame(height: 300)
//                    .background(Color.red) // this will not change the color
                    .colorMultiply(.gray.opacity(0.2)) /// but this is the work around to change the background color.
                Button(
                    action: {
                        
                    },
                    label: {
                        Text("Save")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(25)
                            
                    }
                    )/// this is the end of the Button
                Spacer ()
            }
            .padding()
            .background(Color.white)
            .navigationTitle("TextEditor Bootcamp!!!")
        }
    }
}

#Preview {
    TextEditorsBootCamp()
}
