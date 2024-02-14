//
//  picker.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

import SwiftUI

struct picker: View {
    @State var pickedVal: String = "11"
    @State var filterValue: String = "Most Recentsssssaa"
    @State var segmentedString: String = "Most Recent"
    let allFilterValues = [
    " Most Recentsssaa",
    " Most Likedssss ",
    " Most Seen "
    ]
    var body: some View {
        VStack() {
//            videoExampleOfFilters
            segmentPickerStyle
//
//            HStack() {
//                Text("Age: ")
//                Text(pickedVal)
//            }
//            Picker(
//                selection: $pickedVal, content: {
//                    ForEach(18..<100) {num in
//                        Text("\(num)")
//                            .tag("\(num)")
//                    }
//                    
//                }, label: {
//                    Text("Dum Label")
//                }) /// end of picker
////            .pickerStyle(WheelPickerStyle()) /// this make it looks like a wheel.
//            .pickerStyle(MenuPickerStyle()) /// this is the defualt view, select from menu.
            
        }
    }
    
    var videoExampleOfFilters : some View {
        Picker (
        selection: $filterValue,
        label: HStack() {
            Text("Filters")
            Text(filterValue)
        } ,
        content: {
            ForEach(allFilterValues, id: \.self) { option in
                Text(option) 
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .tag(option)
            }
        }) /// end of picker
        .padding()
        .padding(.horizontal, 20)
        .background(Color.gray.opacity(0.2))
        .pickerStyle(MenuPickerStyle())
    }
    
    var segmentPickerStyle : some View  {
        Picker (
            selection: $segmentedString, content: {
                ForEach(allFilterValues, id: \.self) { option in
                    HStack() {
                        Text(option)
                        Image(systemName: "heart.fill")
                    }.tag(option)
                }
                
            }, label: {
                Text("Filters")
            }
            
            ) /// end of the picker
        .background(Color.gray.opacity(0.2))
        .pickerStyle(SegmentedPickerStyle())
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.cyan /// this is how we can change the color of the selected index.
    }
}

#Preview {
    picker()
}
