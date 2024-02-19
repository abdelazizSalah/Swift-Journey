//
//  UIViewRepresentableBootCamp.swift
//  firstApp
//
//  Created by zizo on 16/02/2024.
//

import SwiftUI

struct UIViewRepresentableBootCamp: View {
    @State var inputText: String = ""
    var body: some View {
        VStack() {
            Text(inputText)
            HStack() {
                Text("SwiftUI: ")
                TextField("Type here... ", text: $inputText)
            }
            HStack() {
                Text("SwiftUI: ")
                UITextFieldViewRepresentable(
                    placeholderText: "new PlaceHolder",
                    placeholderColor: .blue,
                    inputText: $inputText)
                    .frame(height: 100)
            }
        } .padding()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    var placeholderText: String = ""
    let placeholderColor: UIColor
    @Binding var inputText: String
    /// this is responsible for drawing the UI components from UIKit
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator /// if we didn't write this line, we won't be able to see the effect of makeCoordinator function
        return textField
    }
    
    /// this is a utiltiy function to just keep the body of makeUIView clean.
    private func getTextField () -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeHolder = NSAttributedString ( // this allows us to customize the colors of the placeholder.
            string: placeholderText,
            attributes: [
                .foregroundColor: placeholderColor
            ]
        ) /// end of NSAttributedString
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    
    /// this is responsible from sending items from SwiftUI to UIKit
    //    func updateUIView(_ uiView: UIViewType, context: Context) {
    //
    //    }
    /// on changing the return type of makeUI, uiView type will be changed.
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = inputText /// this is to be able to listen to the changed occured from SwiftUI.
    }
    
    func updatePlaceHolder(_ uiView: UITextField, context: Context) -> UITextFieldViewRepresentable {
        var viewRepresentable = self /// accessing the calling object element -> similar to this in cpp. 
        viewRepresentable.placeholderText = inputText
        return viewRepresentable
    }
    
    
    /// this is responsible from sending items from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(inputText: $inputText)
    }
    
    /// this class is used to be able to modify items from UIkit to represent it on swiftUI
    /// it must inheret from NSObject
    /// then we inheret from any Delegate we want.
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var inputText: String
        init(inputText: Binding<String>) {
            _inputText = inputText /// the binding is always perceeded with _
        }
        
        /// we use this function whenever something change in a certain textfield on the screen.
        func textFieldDidChangeSelection(_ textField: UITextField) {
            inputText = textField.text ?? ""
        }
        
    }
}

#Preview {
    UIViewRepresentableBootCamp()
}
