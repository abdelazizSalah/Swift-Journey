//
//  TabViewBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

import SwiftUI

struct TabViewBootCamp: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView (selection: $selectedTab) {
            homeView
                .tag(0)
            BrowseView
                .tag(1)
            profileView
                .tag(2)
        }
        .frame(height: 300)
        .padding(.bottom, -50)
        .accentColor(.red) /// this allows me to change the color of the indicators.
        .tabViewStyle(PageTabViewStyle()) /// this allow us to navigate between screen using swipe instead of pressing on the tabs, usually we use this if we have multiple photos, and want to show them in a slide view.
    }
    
    var homeView : some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Home Tab")
                Button ("Go to profile") {
                    self.selectedTab = 2
                }
                .padding()
                .cornerRadius(20)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .background(Color.black)
            } /// this what apears inside the tab.
            
        }.tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
    }
    
    var BrowseView : some View {
        Text("Browse Tab")
            .tabItem {
                Image(systemName: "globe")
                Text("Browse")
            }
    }
    
    var profileView : some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.top)
            Text("Profile Tab") /// this what apears inside the tab.
        }  .tabItem {
            Image(systemName: "person.fill")
            Text("Profile")
        }
        
    }
}

#Preview {
    TabViewBootCamp()
}
