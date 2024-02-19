//
//  OnAppear_OnDisapper.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
 Typically we use this when we want not to load data, until some views are fully appeared on the screen, and so on.
 The order of calling .onAppear method does matter.
 
 Whenever we need to add delay, we use DispatchQueue
 */
import SwiftUI

struct OnAppear_OnDisapper: View {
    
    @State var myText: String = "Start Text"
    @State var count: Int = 0
    var body: some View {
        NavigationView() {
            ScrollView () {
                Text(myText)
                LazyVStack() {
                    ForEach(0..<50) { _ in /// we use _ when we do not care about the index
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            }) // each  rounded rectangle now has its unique onAppear.
                            .onDisappear( /// now you would easly notice that VStack actualy start with certain items about 6 items, then when we scoll up, it start removing these items, so this make it more efficient in the terms of memory.
                                perform: {
                                    count -= 1
                                })
                    }
                }
            }
            .onAppear(
                perform: {
                    DispatchQueue.main.asyncAfter( /// avoid using dealys as much as you can.
                        deadline: .now() + 5, /* This delay 5 seconds. */
                        execute: {
                            self.myText = "This is new Text"
                    })
                }
            ) /// end of OnAppear
            .onDisappear(
                perform: {
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 5, /* This delay 5 seconds. */
                        execute: {
                            self.myText = "This is similar to destructor."
                    })
                }
            )
            
            .navigationTitle("On Appear Bootcamp \(count)")
            
        }
    }
}

#Preview {
    OnAppear_OnDisapper()
}
