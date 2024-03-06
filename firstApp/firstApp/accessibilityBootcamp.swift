//
//  accessibilityBootcamp.swift
//  firstApp
//
//  Created by zizo on 05/03/2024.
//
/*
 Dynamic Text
 Basiclly it is getting the text on the screen to adapt for all font sizes.
 
 just open canvas
 
 press on the 6 squares over each other -> called varients.
 
 press on Dynamic type varients.
 
 then it would show you how your application would look like in different font sizes.
 
 You may think that no body would use different font sizes, however it is more common than you believe, so whenever you build an ios application, make sure that you would make it dynamic.
 
 Whenever we check the accessibility, we must check for the largest possible text, and the smallest possible text.
 Also try old and new iphone versions.
 
 usually we do not recommend to use fixed height and width, just leave them to be flexible.
 */


import SwiftUI

struct accessibilityBootcamp: View {
    /// These sizeCategory are all the possible categories exist for the fonts.
    @Environment(\.dynamicTypeSize) var sizeCategory;
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (0..<10) { _ in
                    VStack{
                        HStack {
                            /// the images would scale by default, however, if we want them to have fixed size, we could use .system, then add the size we want
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30))
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                                .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                        }
                        .font(.title)
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                            .frame( maxWidth: .infinity, alignment: .leading)
//                            .truncationMode(.tail)
                            .lineLimit(1) /// this limit the expansion till it reach certain number of lines, then it apply truncation.
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor) /// this represents what percentage of the current font size can the system scale down the font fit the line limit, we provide it with float number from 0 up to 1 which represent 100% of the font.
                        ///however, we usually do not use this way so much, because the user has large font to be able to see the text, then your code get the text small anyways, so this is counter intuative, if you want to use it, lets have a reasonable amount.
                        ///moreover, sometimes we need to apply this only if the user has large text, so we can access this using some enviroment variable.
                    }
                }
//                .frame(height: 100)
                .background(.red)
                
            }.navigationTitle("Accessibility!")
        }
    }
}

/// usually we use this way to override the dynamic sizes, and allow only certain changes in the font size based in how large is the font.
extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall,  .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge :
            return 0.8
        default:
            return 0.6
//        case .large:
//            <#code#>
//        case .xLarge:
//            <#code#>
//        case .xxLarge:
//            <#code#>
//        case .xxxLarge:
//            <#code#>
//        case .accessibility1:
//            <#code#>
//        case .accessibility2:
//            <#code#>
//        case .accessibility3:
//            <#code#>
//        case .accessibility4:
//            <#code#>
//        case .accessibility5:
//            <#code#>
        
        }
    }
}

#Preview {
    accessibilityBootcamp()
}
