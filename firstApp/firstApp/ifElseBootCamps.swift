//
//  ifElseBootCamps.swift
//  firstApp
//
//  Created by zizo on 12/02/2024.
//

import SwiftUI

struct ifElseBootCamps: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var showOrHideStringForCircle: String = "Show"
    @State var showOrHideStringForRectangle: String = "Show"
    @State var isLoading: Bool = true
    var body: some View {
        ZStack() {
            /// BackGround
            background
            
            /// content
            content
        }
    }
    
    var loadingContent: some View {
        VStack() {
            
            
            if isLoading {
                Button(
                    action: {
                        self.isLoading.toggle()
                    },
                    label: {
                        Text (" Load Data ")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding()
                    }
                    
                )
                ProgressView() /// this is the main loading indicatior in swift.
                    
                    .padding()
                    
            } else {
                content
            }
        }
    }
    
    var background: some View {
        Color.gray
            .ignoresSafeArea()
    }
    
    var content: some View {
        VStack {
            
            
            Button (
                action: {
                    self.showCircle.toggle() // this changes the value of the bool, if true it would be false, and vice versa.
                    self.showOrHideStringForCircle = showCircle ? "Hide" : "Show" // this is how to use the ternary operators for assignment, instead of duplcating the code -> DRY !
//                    if showCircle {
//                        self.showOrHideStringForCircle = "Hide"
//                    } else {
//                        self.showOrHideStringForCircle = "Show"
//                    }
                    
                    if showRectangle {
                        self.showOrHideStringForRectangle = "Hide"
                    } else {
                        self.showOrHideStringForRectangle = "Show"
                    }
                    
                }, label: {
                    Text("\(showOrHideStringForCircle) Circle Button: \(showCircle.description)")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .bold()
                }
                
            )
            
            Button (
                action: {
                    self.showRectangle.toggle() // this changes the value of the bool, if true it would be false, and vice versa.
                    if showRectangle {
                        self.showOrHideStringForCircle = "Hide"
                    } else {
                        self.showOrHideStringForCircle = "Show"
                    }
                    
                }, label: {
                    Text("\(showOrHideStringForRectangle) Rectangle Button: \(showRectangle.description)")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .bold()
                }
                
            )
            
            
        if showCircle {
            Circle()
                .fill(Color.black)
                .frame(width: 100)
            
        }
            
        if showRectangle {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 150)
        }
            
            if showCircle && showRectangle {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.red)
                    .frame(width: 300, height: 100)
                    .padding(.top, 10)
            }
            
            
        }
    }
}

#Preview {
    ifElseBootCamps()
}
