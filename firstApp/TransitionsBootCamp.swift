//
//  TransitionsBootCamp.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//

/*
     General Tip,
 When you have something that was not on the screen and want to show it, use the transition, while if you want to change the value of something already exist in front of the user, like the background Color, use the animation.
 
 */

import SwiftUI

struct TransitionsBootCamp: View {
    @State var showView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack() {
                Button("Button") {
                    showView.toggle()
                }
                
                Spacer()
            }
            
            if showView{
                RoundedRectangle(cornerRadius: 50)
                    .frame(
                        height: UIScreen.main.bounds.height * 0.5 // this is how we can get the height of the screen, dynamically
                    )
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom)) /// edge is the edge of the RoundedRectangle, and this give the feeling of sliding model bottom sheet, or when the keyboard opens.
//                    .transition(AnyTransition.opacity.animation(.easeInOut)) /// this is how we can apply the .opacity animation.
                    .transition(
                        .asymmetric(insertion: /// this apply asymmetric animation, one while inserting the object, and the other when the object disappears from the screen.
                                .move(edge: .leading),
                                    removal: .move(edge: .bottom)))
//                    .opacity(showView ? 1.0 : 0)
                    .animation(.easeInOut) // value is the item on its change we apply the animation.
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom) // ignore bottom safe area only.
    }
}

#Preview {
    TransitionsBootCamp()
}
