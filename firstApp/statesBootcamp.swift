//
//  statesBootcamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

import SwiftUI

struct statesBootcamp: View {
    /// it tells the view to observe that variable, because once it is changed, we need to update the view.
    @State var backgroundColor: Color = Color.green
    @State var title: String = "my Title"
    @State var count: Int = 1
    var body: some View {
        ZStack() {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text (title)
                Text ("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 10) {
                    Button("Button 1") {
                        self.backgroundColor = Color.purple
                        self.title = "Button 1 is pressed"
                        self.count += 1
                    }
                    
                    Button("Button 2") {
                        self.backgroundColor = Color.cyan
                        self.title = "Button 2 is pressed"
                        self.count -= 1
                    }
                }
            } .foregroundStyle(Color.white)
                .font(.title)
        }
    }
}

#Preview {
    statesBootcamp()
}
