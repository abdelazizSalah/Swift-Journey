//
//  TextFieldBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

import SwiftUI

struct TextFieldBootCamp: View {
    @State var TextFieldText: String = ""
    @State var dataText: [String] = []
    var body: some View {
        NavigationView () {
            
                VStack() {
                    TextField("This is a placeholder that appears when no text is there", text: $TextFieldText) /// it works for one line text only, if we need multiple lines, then we need to use textEditor 
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    Button (
                        action: {
                            if textIsAppropriate() {
                                dataText.append(TextFieldText)
                                TextFieldText = ""
                            }
                        },
                        label: {
                            Text("Save")
                                .font(.title3)
                                .bold()
                        }
                    ) /// the end of the button
                    .disabled(!textIsAppropriate()) /// this disable the button, so we can never press on it, unless we have false in the disabled.
                    .frame(maxWidth: .infinity)
                    
                    .padding()
                    
                    .background(textIsAppropriate() ? Color.blue : Color.gray).cornerRadius(20)
                    .foregroundColor(.white)
                    Spacer()
                    ScrollView( showsIndicators: false  ,content: {
                        ForEach(dataText, id: \.self , content: {text in
                            Text(text)
                        })
                    })
                }.padding()
                
                    .navigationTitle("Text Field Bootcamp!")
            
        }
    }
    
    func textIsAppropriate () -> Bool {
        if TextFieldText.count >= 3 {
            return true
        }
        return false
    }
}

#Preview {
    TextFieldBootCamp()
}
