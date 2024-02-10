//
//  forEachBootCamp.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//
/*
    This is how we iterate over elements, or insert multiple elements but instead of hard coding them, we just use loop.
 
    To use it we write ForEach (...)
 
    1. to use the for (int i = 0 to i = some range we write it as follows:
        ForEach(startCounter..<endCounter){ Data to be shown)
    
    2. to use it to show data inside an array.
        ForEach (data.indicies) { index in // da esm el variable el gowa el data, w msh bynf3 enna ne3ml access lel element 3ltoul, akno map keda, lazm a3mlo access mn el index bta3o.
            // print what in the array
            Text("\(data[index]))
        }
    
 */

import SwiftUI

struct forEachBootCamp: View {
    let data: [String]
    let myString:String = "Hello"
    var body: some View {
        VStack() {
            /// This is the manual method of writing one two three
//            Text("One")
//            Text("Two")
//            Text("Three")
            
            /// now lets try use for each
//            ForEach(0..<10) { index in
//                HStack(){
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 20, height: 20)
//                    Text("The index is: \(index)")
//                        .font(.title)
//                }
//            } // end of for loop.
        
            /// lets do for each on the data in the array.
            ForEach(data.indices) { index in
                Text (" New Item: \(data[index])")
                    .font(.title)
                    .bold()
                
            }
            
        }
        
    }
}

#Preview {
    forEachBootCamp(data:["Ahmed", "Mohammed","Tamed", "Salama","Kamal", "Khaled"])
}
