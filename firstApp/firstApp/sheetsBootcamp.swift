//
//  sheetsBootcamp.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//

/*
 .sheet -> we apply it on any item
 we use the (
 isPresented -> Binded boolean -> must pass bool, and preceeded with $ sign.
 content -> the content of the sheet.
 
 1.  .sheet property can be only used once per View, so we can not cascade sheets at the same view.
 2.  also we can not put conditions, if ... show sheet1, else show sheet2
 3. fullScreenCover -> is similar to the .sheet, but it fill the whole screen. 
 */

import SwiftUI

struct sheetsBootcamp: View {
    @State var showSheets: Bool = false
    var body: some View {
        ZStack() {
            /// background
            backGround
            /// content
            content
        }
    }
    
    var backGround: some View {
        Color.green.ignoresSafeArea()
    }
    
    var content: some View {
        Button (
            action: {
                self.showSheets.toggle()
            },
            label: {
                Text("Button")
                    .foregroundStyle(Color.green)
                    .font(.title)
                    .padding()
                    .background(Color.white.cornerRadius(20))
            }
            
        ).sheet(isPresented: $showSheets, content: {
//            Text (" Hello there !!!! ")
            
            /// it is better to show a netter view
            SecondScreen()
        })
    }
}

struct SecondScreen: View {
    /// in Swift UI there is something called the Enviroment variable which is declared just like this, and it is a binding variable, which is binded to the current presentation on the screen.
    @Environment(\.presentationMode) var presentationMode
    
    @State var showSheets: Bool = false
    @State var showThird: Bool = false
    var body: some View {
        ZStack (alignment: Alignment.topLeading){
            /// background
            backGround
            
            /// the content
            content
        }
    }
    
    var backGround: some View {
        Color.red.ignoresSafeArea()
    }
    
    var content: some View {
        Button (
            action: {
                /// this is how we can dismiss the screen.
                /// this code you must memorize it, it is a template of removing screens.
//                presentationMode.wrappedValue.dismiss()
                showThird = false
                showSheets.toggle()
                
            },
            label: {
                /// usually when we have a sheet, we should insert a X mark to allow the user to close the sheet.
                Image(systemName: "xmark")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .padding()
                    .padding(.top, 20)
//                    .background(Color.white.cornerRadius(20))
            }
            
        ).sheet(isPresented: $showSheets, content: {
//            Text (" Hello there !!!! ")
            
            /// Don't use any conditional logic here
            
            /// it is better to show a netter view
            if showThird { /// this will not work, there is a special way to show different content, we will learn it later.
                sheetsBootcamp()
            } else {
                ThirdScreen()
            }
        })
    }
}

struct ThirdScreen: View {
    /// in Swift UI there is something called the Enviroment variable which is declared just like this, and it is a binding variable, which is binded to the current presentation on the screen.
    @Environment(\.presentationMode) var presentationMode
    
    @State var showSheets: Bool = false
    var body: some View {
        ZStack (alignment: Alignment.center){
            /// background
            backGround
            
            /// the content
            content
        }
    }
    
    var backGround: some View {
        Color.red.ignoresSafeArea()
    }
    
    var content: some View {
        Button (
            action: {
                /// this is how we can dismiss the screen.
                /// this code you must memorize it, it is a template of removing screens.
//                presentationMode.wrappedValue.dismiss()
                showSheets.toggle()
            },
            label: {
                /// usually when we have a sheet, we should insert a X mark to allow the user to close the sheet.
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .padding()
                    .padding(.top, 20)
//                    .background(Color.white.cornerRadius(20))
            }
            
        ).fullScreenCover(isPresented: $showSheets, content: {
            SecondScreen()
        })
    }
}

#Preview {
    sheetsBootcamp()
}
