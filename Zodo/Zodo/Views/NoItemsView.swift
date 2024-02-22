//
//  NoItemsView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    let secondaryAccentColor: Color = Color("secondaryAccentColor")
    var body: some View {
        ScrollView {
            ZStack() {
                VStack(spacing: 10) {
                    VStack(spacing: 0){
                        Text("There is no items! 😓")
                            .font(.title)
                            .fontWeight(.semibold)
                        Capsule()
                            .frame(height: 3)
                        Spacer().frame(height: 10)
                    }
                    Text("Are you a productive person? I think you should click the add buton and add a bunch of items to your  Todo list!!!")
                        .padding(.bottom, 40)
                    
                    NavigationLink (destination: AddView(), label: {
                        Text("Add Something 🥳")
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(self.animate ?  Color.accentColor : secondaryAccentColor)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                            .font(.headline)
                            .fontWeight(animate ? .bold : .semibold)
                    })
                    .padding(.horizontal, animate ? 10 : 30)
                    .shadow(
                        color: self.animate ?  Color.accentColor.opacity(0.7) : secondaryAccentColor.opacity(0.6),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(!animate ? 1.1 : 0.9)
                    .offset(y: animate ? -10 : 0)
                    
                }
            }
            .multilineTextAlignment(.center)
            .padding(40)
        .onAppear(perform: applyAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func applyAnimation () {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation.bouncy(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
            
        })
    }
}

#Preview {
    NavigationView{
    NoItemsView()}
}
