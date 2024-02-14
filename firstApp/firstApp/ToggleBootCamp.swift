//
//  ToggleBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

import SwiftUI

struct ToggleBootCamp: View {
    @State var toggleIsOn: Bool = false
    @State var TimeArray: [String] = [
        "4: 00 am",
        "5: 00 am",
        "6: 00 am",
        "7: 00 am",
        "8: 00 am",
        "9: 00 am",
        "10: 00 am",
        "1: 00 am",
        "2: 00 am",
        "3: 00 am",
        "4: 00 am",
    ]
    var body: some View {
        NavigationView {
            
            List {
                ForEach(TimeArray, id: \.self) { time in
                    Toggle(
                        isOn: $toggleIsOn, label: {
                            Text(time).font(.title2).bold()
                        }
                    )/// this is the end of the toggle.
                    .toggleStyle(SwitchToggleStyle(tint: Color.purple))
                    .padding()
                    
                }
                .onDelete(perform: onDelete) // lazm n7utha 3la akher el forEach
                .onMove(perform: { indices, newOffset in
                    
                })
                
                .background(Color.mint)
                .foregroundStyle(Color.black)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x:10, y: 10)
                .cornerRadius(25)
            }
            
            .navigationTitle("Clock app")
            .navigationBarItems(leading:
                                    HStack() {
                EditButton()
            }
                                
            )
        }
        
        
    }
    func onDelete (indexSet: IndexSet) {
        
    }
}

#Preview {
    ToggleBootCamp()
}
