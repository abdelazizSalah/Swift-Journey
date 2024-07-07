//
//  NavigationBootCamp.swift
//  firstApp
//
//  Created by zizo on 13/02/2024.
//

/*
 1. Navigation View would look different on different devices.
 2. Never embed a Navigation inside another navigation view.
 
 Navigation View is similar to any View, but usually we use it to be able to navigate between screens.
 Navigation link is how we set hyper link, with default name, then on click, we open another screen. 
 */
import SwiftUI

struct NavigationBootCamp: View {
    var body: some View {
        NavigationView() {
            ScrollView () {
               
                
                NavigationLink("Go the next Screen", destination: NavigationScreen())
                Text("This is a Navigation")
                Text("This is a Navigation2")
                Text("This is a Navigation3")
            }
            .navigationTitle("All Inbox")
            .navigationBarTitleDisplayMode(.automatic) /// there are 3 possible values, inline, automatic, and large, usually we should leave it automatic, it is automatic by default
            //            .navigationBarHidden(true) this is to hide the navigation bar.
            .navigationBarItems(
                leading: HStack {
                    NavigationLink (
                        destination: {
                            ZStack() {
                                Color.gray.ignoresSafeArea()
                                Text("Person is working")
                            }
                        }, label: {Image(systemName: "person.fill")}
                        
                    )
                    NavigationLink (
                        destination: {
                            ZStack() {
                                Color.green.ignoresSafeArea()
                                Text("Flame is working Too")
                            }
                        }, label: {Image(systemName: "flame.fill")}
                        
                    )
                    
                },
                trailing:  NavigationLink (
                    destination: {
                        ZStack() {
                            Color.green.ignoresSafeArea()
                            Text("Gear is working Too")
                        }
                    }, 
                    label: {Image(systemName: "gear").accentColor(.blue)}
                    
                )
            )
        }
    }
}

struct NavigationScreen: View {
    @Environment(\.presentationMode) var presentationMode /// we will use this to back to the last screen
    
    var body: some View {
        ZStack() {
            /// backgorund
            backGround
            /// content
            content
        }
    }
    
    var backGround: some View {
        Color.yellow.ignoresSafeArea()
    }
    
    var content: some View {
        VStack {
            Text ("This is a new Screen")
                .font(.title)
                .bold()
                .foregroundStyle(Color.black)
                .navigationTitle("Yellow Screen")
                .navigationBarHidden(true)
            
            Button("Back Button") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}


#Preview {
    NavigationBootCamp()
}
