//
//  IntroView.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

import SwiftUI

struct FindYourMatchApp: View {
    @AppStorage ("signed_in") var isSignedIn : Bool = false
    var body: some View {
        ZStack() {
            backGround
            /// content
            if isSignedIn {
                withAnimation( .bouncy(duration: 3) ){
                    ProfileView()
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                }
            } else {
                withAnimation( .bouncy(duration: 3) ){
                        onBoardingView()
                    }
            }
        }
    }
    var backGround : some View {
        RadialGradient(
            colors: [Color.blue, Color.blue, Color.purple.opacity(0.8)],
            center: .topLeading,
            startRadius: 5,
            endRadius: UIScreen.main.bounds.height )
        .ignoresSafeArea()
    }
}

#Preview {
    FindYourMatchApp()
}
