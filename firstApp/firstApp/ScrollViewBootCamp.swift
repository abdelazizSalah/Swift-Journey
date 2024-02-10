//
//  ScrollViewBootCamp.swift
//  firstAppTests
//
//  Created by zizo on 11/02/2024.
//

/*
 Now its time to be able to apply scrolling
 we can scroll either horizontally or vertically.
 
 to scroll horizontally, we put .horizontal in the brackets of the ScrollView
 ScrollView(.horizontal ... ) {
 ... data
 }
 
 // it is vertical by default.
 
 we can turn the scrolling indicator of by setting showIndicators: false in the constructor
 ScrollView(showIndicators: false) ...
 
 in VStack, or HStack, all the content is loaded on load, this may be okay in a small data set, however, in large datasets, we need to have better implementation for such things, so that is why we go to the LazyVStack or LazyHStack :D
 
 so the Lazy just create the elements, on demand only, when we need them, to avoid downloading extra data.
 */

import SwiftUI

struct ScrollViewBootCamp: View {
    //    enum Colors{
    //        case red = Color.red // literal means that is should be some hardcode, you can not use an enum of another element as a default value.
    //        case gray = Color.gray
    //        case blue = Color.blue
    //        case green = Color.green
    //    }
    let ColorArray:[Color] = [
        Color.red,
        Color.blue,
        Color.purple,
        Color.pink,
    ]
    
    
    var body: some View {
        /// Playing Code
//        ScrollView(.horizontal,showsIndicators: false) // the right indicator which show the scrolling which lies on the right)
//        { // this is all we need to write, to be able to make the screen scrollable.
//            HStack(alignment: .center, content: {
//                ForEach(0..<120) {index in
//                    
//                    Rectangle()
//                        .fill(ColorArray[index % ColorArray.count])
//                        .frame(width: 100,height: 100)
//                    
//                    
//                    
//                }
//            })
//        }
        
    /// lets implement the code of the video
        /// This is a very common template. 
        ScrollView(showsIndicators: false) {
            ForEach(0..<20) {item in
                LazyVStack() {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack() {
                            ForEach(0..<20) {index2 in
                                    RoundedRectangle(cornerRadius: 40)
                                    .fill(ColorArray[index2 % ColorArray.count])
                                    .frame(width: 200, height: 300)
                                    .shadow(color: Color.black,radius: 30)
                                    .padding(.all, 40)
                            }
                        }
                    }
                }
            }
            
        } /// tb wlahy tuhfaaa <3
    }
}

#Preview {
    ScrollViewBootCamp()
}
