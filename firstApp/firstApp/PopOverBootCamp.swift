//
//  PopOverBootCamp.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//


/*
 Here we will use 3 different methods, to get the exact same result.
 .sheets()
 .transition()  -> Try to use this whenever it is possible, because it is the most dynamic way.
 .animation()
 */
import SwiftUI

struct PopOverBootCamp: View {
    @State var showNewScreen: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            /// background
            backGround
            
            /// Content
            content
//            / METHOD 1  -  USING SHEETS
                    .sheet(isPresented: $showNewScreen, content: {
                        AnotherScreen(showNewScreen: $showNewScreen)
                    })
                    
            /// METHOD 2  -  USING TRANSITIONS
//            ZStack() {
//                if showNewScreen {
//                    AnotherScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 10)
//                        .transition(
//                            .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom))
//                        )
//                        .animation(
//                            .easeInOut
//                        )
//                }
//            } .zIndex(2.0) /// this indicates that this must be the second layer no matter what happens, to allow the transition effect of the fading out
            
            /// METHOD 3  -- ANIMATION
//            AnotherScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 10)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(Animation.spring)
        }
    }
    
    var backGround: some View {
        Color.orange.ignoresSafeArea()
    }
    
    var content: some View {
        
            Button (
                action: {
                    /// Show new Screen
                    withAnimation(Animation.spring) {
                        self.showNewScreen.toggle()
                    }
                },
                label: {
                    Text("Show New Screen\n \(showNewScreen.description)")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .bold()
                        .padding()
                }
                
                
            ) /// end of the button
            
        
    }
}

struct AnotherScreen: View {
    @Environment(\.presentationMode) var presentedScreen
    @Binding var showNewScreen: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            /// background
            backGround
            
            /// Content
            content
        }
    }
    
    var backGround: some View {
        Color.mint.ignoresSafeArea()
    }
    
    var content: some View {
        Button (
            action: {
                /// Show new Screen
                presentedScreen.wrappedValue.dismiss() /// This will work only if we have a sheet
                
                /// to remove the new screen if we do not have sheet, but transition or animation, we will use the binding.
                withAnimation(Animation.spring) {
                    self.showNewScreen.toggle()
                }
            },
            label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .bold()
                    .padding()
                    .padding(.init(top: 30, leading: 10, bottom: 0, trailing: 0))
            }
            
            
            
        )
    }
}

#Preview {
    PopOverBootCamp()
}
