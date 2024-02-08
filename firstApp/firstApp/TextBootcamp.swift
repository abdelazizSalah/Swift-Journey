//
//  TextBootcamp.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//

import SwiftUI

/*
  Important Notes:
 ---------------------
 1. The order of calling the utility methods, matter, actually I do not till know, why does it actually matter, but it does.
 2. .system() allows you to manually customize the fonts of the application.
 3. baselineOffset() determine the height of the test, and how they should be separated vertically.
 
 */

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World!, Now Abdelaziz can successfully build mobile applications using swift.".uppercased().lowercased()) // we can use string functions directly on a bare string. 
//            .font(.body)    usually we put each new property on a separated line.
            .fontWeight(.semibold)
            .bold()
//            .underline()
            .underline(true, color: Color.red )
            .italic()
//            .strikethrough(true, color: Color.blue)
            .font(.system(size: 40, weight: .semibold, design: .serif)) // this is how we can manually customize the font by ourselves.
            
            .multilineTextAlignment(.center) // this is how we align the text, in case that we have multilines., arguments options are .leading, .trailing, .center.
            .baselineOffset(20) // spacing between lines.
            .kerning(4) // this is the spacing between each two letters.
            .foregroundColor(.black)
            .frame(width: 300, height: 400, alignment: .topLeading) // this determine the frame in which the text should be inserted in, like sizedBox in flutter.
            .minimumScaleFactor(0.5) // this is a percentage of the text font size, which allows the text to shrink to certain percentage, so it can fit inside a certain frame, as you decrease the value, as the text will be able to shrink.
    }
}

#Preview {
    TextBootcamp()
}
