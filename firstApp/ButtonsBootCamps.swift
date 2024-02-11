//
//  ButtonsBootCamps.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

import SwiftUI

struct ButtonsBootCamps: View {
    /// @State property represent that this variable can be changed. 
    @State var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            Button("Press Me !") {
                // This is the code which will be executed whenever the button is pressed.
                self.title = "Button is pressed!"
            }
            
            /// if we want to style the Button, so we need to use this way of initializing.
            /// action -> inwhich we insert the body of the logic we need to apply.
            /// label -> the widget we want to show on the screen.
            Button(
                action:{
                    self.title = "The second button is pressed !"
                },
                label: {
                    Text("Save!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(20)
                        .padding(.horizontal, 20)
                        .background(Color.blue
                            .cornerRadius(10, antialiased: true) // this allow us to give a corner shape to the object.
                            .shadow(color: Color.black.opacity(0.2), radius: 10)
                        )
                    
                }
                
            )
            
            /// circular heart button
            Button (
                action: {
                    // we should do something on tapping the button.
                    self.title = "I Love You!"
                },
                label: {
                    Circle()
                        .fill(Color.white)
                        .frame (width: 100)
                        .shadow(color: Color.black.opacity(0.3) ,radius: 10)
                        .overlay(
                            Image(systemName: "heart.fill")
                                .font(.system(size: 45))
                                .foregroundStyle(Color(red: 0.7, green: 0.1, blue: 0.2))
                        )
                }
                
            ) /// the end of the heart button.
            
            /// creating a capsule finish button
            Button (
                action: {
                    self.title = "We are finished"
                },
                label: {
                    Text("Finished".uppercased())
                        .foregroundStyle(Color.gray)
                        .padding()
                        .padding(.horizontal, 10)
                        .bold()
                        .background(
                            Capsule()
                                .stroke(Color.gray, lineWidth: 3 )
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                        )
                    }
                
            ) /// the end of the capsule button
        }
    }
}

#Preview {
    ButtonsBootCamps()
}
