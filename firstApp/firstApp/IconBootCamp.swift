//
//  IconBootCamp.swift
//  firstApp
//
//  Created by zizo on 04/02/2024.
//

/*
 Here we learn how to use built in icons, provided by SwiftUI.
 to be able to use it we use the Image class
 then we use the systemName parameter, and provide it with a string, which is the name of the icon we need to use, so usually we need to know these diferent names, using the documentation.
 
 To find the names of the Icons you need to insert, just download SF Symbols, and you will find a list of icons, copy the name of the icon, and insert it as a systemName string
 
 Some of the Icons are with multiColor, to change their color, we use the method
 "renderingMode(.original)", and you can customize the color of the blue parts.
 */

import SwiftUI

struct IconBootCamp: View {
    var body: some View {
        Image(systemName: "person.2.badge.key.fill")
        
            .renderingMode(.original)
            .resizable() // THIS NEED TO BE THE FIRST THING, it allow the icon to fit in the specified frame, if we didn't use it, and we called the .frame, the frame will be defined, but the size of the icon will not be changed.
            .aspectRatio(contentMode:.fill) // This allows us to define how the image should be sized within the defined frame. and we have 2 possible options, .fill, .fit,
        /*
         .fill, make the image fill the whole frame completely, possibly cropping parts of the image to maintain the aspect ratio. f7ata lw el image akbur mn el frame, hya ht2oso 34an yeb2a monasb 3la el frame, w lw a2al, fa hya btmoto.
         
         .fit baa msh keda, el image hy7slaha sizing, b7es enha t fit kolaha gowa el frame, y3ny lw enta 3aml width 800, w height 800, el .fill htkbr el sora aw el icon gedan, 34an tmla kol el msa7a el mwgoda, lakn el . fit, bt5ly el sora 3la ad el msa7a el mwgoda bs, mn gher ma n3ml cropping lel icon.
         
         5olasa, lw 3ady blnesbalk enna n3ml crop lel image, aw el icon, est5dm .fill, lw 3auz el icon tban mn gher ma yt2s mnha haga est5dm .fit.
         */
        // instead of .asepct Ratio, we can use
            .scaledToFit() // fit
//            .scaledToFill() // fill, same function as .aspectRatio.
        
            .font(.system(size: 150))
            
//            .font(.largeTitle)
            .foregroundColor(Color(red: 0.8, green: 0.0, blue: 0.2))
            .frame(width: 300, height: 500)
            .clipped() // to clip any extra part out of the defined frame.
//        Text("Hello, World!")
    }
}

#Preview {
    IconBootCamp()
}
