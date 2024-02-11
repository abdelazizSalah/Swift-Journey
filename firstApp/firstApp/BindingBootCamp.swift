//
//  BindingBootCamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

/*
    @Binding Property allows us to bind a variable in the child subview with that in the parent, so if we changed the value in the child subView, it should be reflected back in the parent View.
 
 */
import SwiftUI

struct BindingBootCamp: View {
    @State var backGroundColor: Color = Color.green
    @State var title: String = "Button"
    var body: some View {
        ZStack() {
            /// background
            backGroundColor
                .ignoresSafeArea()
            
            /// content
            /// to pass a binding object, we must perceed the name with the dollar $ sign.
            /// I believe that this means that we pass it by reference, but I am not sure. 
            /// but if you think about it, it is actually the same logic.
            ButtonView(backgroundColor: $backGroundColor, title: $title)
        }
    }
}

struct ButtonView: View {
    @Binding var backgroundColor: Color // we can change the name, but usually we keep the same signature.
    @State var buttonColor: Color = Color.pink
    @Binding var title: String
    var body: some View {
        Button(
            action: {
                self.backgroundColor = Color.indigo
                self.buttonColor = Color.black
                self.title = "New Title!"
            },
            
            label: {
                Text(title)
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(buttonColor)
                    .cornerRadius(10)
            }
        
        )
    }
}

#Preview {
    BindingBootCamp()
}
