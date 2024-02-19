//
//  markupsAndDocumentations.swift
//  firstApp
//
//  Created by zizo on 17/02/2024.
//

import SwiftUI

struct markupsAndDocumentations: View {
    // MARK: PROPERTIES
    @State var showAlert: Bool = false
    @State var data : [String] = [
        "Apple", "Bananas", "Oranges"
    ]
    // MARK: BODY
    
    // Abdelaziz - Working copy - things to do:
    /// 1) Fix Titles
    /// 2) Fix Alerts
    /// 3) Fix something else.
    var body: some View {
        NavigationView () {
            ScrollView {
                ZStack {
                    /// backgorund
                    Color.green
                    
                    /// foreground
                    content
                }
            }.navigationTitle("Documentation")
                .navigationBarItems(trailing:
                                        Button("Alert") {
                    showAlert.toggle()
                }
                ).alert(isPresented: $showAlert, content: {
                    getAlert(text: "This is an alert!!!")
                })
        }
        
    }
    
    /// This is the content of the ZStack that holds the VStack
    /// we create the description using the three back-slashes.
    private var content: some View {
        VStack( ) {
            Text("Hello")
            ForEach(data, id: \.self,  content: { fruit in
                Text(fruit)
                    .font(.title2)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .foregroundStyle(Color.shadow)
                
            })
        }
    }
    
    
    // MARK: FUNCTIONS
    /// This function just return an alert with a specified text
    ///
    ///
    ///    The discussion must be between the description and the parameters, using some extra space, and usually we use native english to descripe this discussion
    ///
    ///    ```
    ///             var x: Int = 1
    ///              var y: Int = 2
    ///              return x + y
    ///              /// here we just show some code.
    ///    ```
    ///
    /// - Warning: Make sure that you understand all what is explained please!
    /// - Parameter text: this is the title of the alert
    /// - Returns: Returns an alert with a title
    func getAlert( text : String) -> Alert {
        return Alert (
            title: Text(text))
        
        
    }
}

#Preview {
    markupsAndDocumentations()
}
