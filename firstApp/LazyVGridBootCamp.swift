//
//  SwiftUIView.swift
//  firstApp
//
//  Created by zizo on 11/02/2024.
//

/*
 All grids in SwiftUI are grid by default.
 
 Grids are same as VStack or HStack but combine both together.
 Columns are objects of [GridItem]
 GridItem is just an item which tells the Grid how large our item should be
 
 GridItem (
 
 1. size -> it has three options
 1.1. fixed () ->
 we set the width of the column as a fixed number of pixels.
 1.2. flexible() ->
 it take as much space as it can, and it dynamically resize if there are more items in the screen.
 we can set minimum width, and maximum width too, so it is the most used type.
 1.3. adaptive () ->
 we must set the minimum and maximum width, and then the widget try to fit as many items as it can in one column based on the minimum and maximum, then it go to the next column, it is not used that often, but it is good to know about it.
 
 every thing in LazyVGrid is applied on LazyHGrid.
 
 */

import SwiftUI

struct LazyVGridBootCamp: View {
    let Columns: [GridItem] = [ /// this define number of columns we need in our grid, and it work like a wrap, it put one item in each column, till we fill the whole columns, then start creating a new row, and keep inserting.
        //        GridItem(.fixed(50), spacing: nil, alignment: nil),
        //        GridItem(.fixed(80), spacing: 40, alignment: nil),
        //        GridItem(.adaptive(minimum: 70, maximum: 900), spacing: nil, alignment: nil),
        //        GridItem(.adaptive(minimum: 10, maximum: 80), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil), // spacing here is between the columns.
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.gray)
                .frame(height:400)
            
            LazyVGrid(
                columns: Columns,
                alignment: .center,
                spacing: 6, // here we set the spacing between rows.
                
                /// this allows that with scrolling down, the headers stay appear at the top of the screen.
                pinnedViews: [.sectionHeaders]
                
            ){
                /// this section is awesome :D
                Section(header:
                            Text("Section1")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.black)
                                .padding()
                        
                
                ) {
                    ForEach(0..<52){ index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 150)
                    }
                }
                /// this section is awesome :D
                Section(header:
                            Text("Section2")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.red)
                                .padding()
                        
                
                ) {
                    ForEach(0..<52){ index in
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 150)
                    }
                }
                
                
            }
            
        }
        
        
        /// nice template for instagram :D
        //        ScrollView () {
        //            Rectangle()
        //                .fill(Color.white)
        //                .frame(height: 400)
        //
        //            LazyVGrid(columns: Columns) {
        //                ForEach(0..<52){ index in
        //                    Rectangle()
        //                        .fill(Color.blue)
        //                        .frame(height: 150)
        //                }
        //            }
        //        }
    }
}

#Preview {
    LazyVGridBootCamp()
}
