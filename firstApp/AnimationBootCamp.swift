//
//  AnimationBootCamp.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//

/*
    Animations are awesome, and make the UI interresting.
 
    With animation, we can create a waiting progress indicator easily
 */

import SwiftUI

struct AnimationBootCamp: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack() {
            /// background
            backGround
            /// content
            waitingProgressIndicator
        }
    }
    
    var backGround: some View {
        Color.gray.ignoresSafeArea()
    }
    
    var waitingProgressIndicator: some View {
        VStack{
            Button (
                action: {
                    withAnimation(
                        Animation
                            .default
//                            .repeatForever()
                    ){
                        self.isAnimated.toggle()
                    }
                },
                label: {
                    Text ("Animate")
                }
            )
            
            Circle()
            
                .stroke(style: StrokeStyle(
                    lineWidth: 10,
                    dash: [100]
                ))
                .frame(width: 200)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
//                .animation(
//                    Animation
//                        .default
////                        .repeatForever(autoreverses: true) /// This is the way we want to apply the animation with nothing to be done to the button, however, this is not the typical way of doing the animation, usually, we apply the animation after pressing on some buttons.
//                )
            
        }
    }
    
    var animationContent: some View {
        VStack () {
            Button (" Button ") {
                /// some logic must be applied here
//                withAnimation(.easeInOut){
                withAnimation(
                    Animation
                        .default
                        .repeatForever()
                ){ // this is how we can apply a delay on the animation.
                self.isAnimated.toggle()}
            }
            
            Spacer ()
            
            RoundedRectangle(cornerRadius: isAnimated ? 25 : 200)
                .fill(isAnimated ?
                      LinearGradient(
                        colors: [Color.red, Color.blue],
                        startPoint: .leading,
                        endPoint: .trailing)
                      :
                        LinearGradient(
                            colors: [Color.orange,Color.indigo, Color.pink ,Color.blue],
                        startPoint: .leading,
                        endPoint: .trailing))
                .frame(width: isAnimated ? 300 : 100 , height: isAnimated ? 350 : 250)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0 ))
//                .offset(y: isAnimated ? 200 : -200)
            
            Spacer()
        }
    }
}

#Preview {
    AnimationBootCamp()
}
