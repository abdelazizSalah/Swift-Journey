//
//  AnimationCurvesAndTimingBootCamp.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//

import SwiftUI

struct AnimationCurvesAndTimingBootCamp: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack() {
            Button("Button") {
                withAnimation(){
                self.isAnimated.toggle()
            }
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 150, height: isAnimated ? 50 : 100)
                .padding()
                .animation(Animation.easeIn(duration: 10)) // slow at the begining, then fast at the end
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 150, height: isAnimated ? 50 : 100)
                .padding()
                .animation(Animation.easeOut(duration: 10)) // fast at the begining, then slow at the end
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 150, height: isAnimated ? 50 : 100)
                .padding()
                .animation(Animation.easeInOut(duration: 10)) // slow fast slow
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 150, height: isAnimated ? 50 : 100)
                .padding()
                .animation(Animation.linear(duration: 10)) // it increases/decreases the speed gradually.RoundedRectangle(cornerRadius: 20)
                Circle()
                .frame(width: isAnimated ? 350 : 150, height: isAnimated ? 50 : 100)
                .padding()
                .animation(Animation.spring(
                    response: 3.0, // the duration
                    dampingFraction: 0.2, // it apply bouncing effect
                    blendDuration: 1.0
                    
                
                )) // it increases/decreases the speed gradually.
        }
    }
}

#Preview {
    AnimationCurvesAndTimingBootCamp()
}
