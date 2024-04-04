//
//  ContentView.swift
//  Calculator_gRPC
//
//  Created by zizo on 04/04/2024.
//
/// It Worked!!!!!!!!!!!!!!
/// This file contains UI for 4 functions using gRPC Protocol
///     Unary
///     Server Stream
///     Client Stream
///     Bidirectional Stream

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(
                action: {
                    /// Working :D <3
                    GRPCManager.shared.findMax()
                },
                label: {
                    Text("Find Max")
                }
            
            )
            .padding(.all, 30)
            .background(.red)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .bold()
            Button(
                action: {
                    /// Working :D
                    GRPCManager.shared.invokeFiboStream()
                },
                label: {
                    
                        Text("Invoke Fibo")
                }
            
            )
            .padding(.all, 30)
            .background(.blue)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .bold()
            Button(
                action: {
                    GRPCManager.shared.computeAverage()
                },
                label: {
                    /// Working!!!!!
                        Text("Compute Average")
                }
            
            )
            .padding(.all, 30)
            .background(.yellow)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .bold()
            Button(
                action: {
                    GRPCManager.shared.addTwoNumbers(num: 5, num2: 8)
                },
                label: {
                        /// Working :D
                        Text("Compute Sum")
                }
            
            ) 
            .padding(.all, 30)
            .background(.green)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .bold()
        }
    }
}

#Preview {
    ContentView()
}
