//
//  paddingBootcamp.swift
//  firstApp
//
//  Created by zizo on 08/02/2024.
//

import SwiftUI

struct paddingBootcamp: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Hello, World! This is fun").font(.title).bold().underline(true, color: Color.red)
    //            .background(Color.yellow)
    //            .padding(.all, 70) // this is how to make the frame take a dynamic size based on its content, it provide a default padding in all directions, and I blieve it provide 8 pixels.
    //            .padding(.top, 10)
    //            .padding(.leading, 40)
    //            .padding(.bottom, 20) // this is how we apply stacked padding.
    //            .background(Color.blue)
    //            .padding(EdgeInsets())
    //            .frame(width: 300, height: 300)
            /// lets make the video example.
                .frame(maxWidth:.infinity,  alignment: .leading ).padding(.leading, 10) // tohfaaaaaaa.
                .padding(.vertical, 20)
            
            Text("This is the description, for what we do on the screen, to be multiple line, and we will align the text to leading edge.").foregroundStyle(Color.black).padding(.vertical, 10)
                
        }.padding().background(Color.white).shadow( color: .black.opacity(0.5), radius: 10, x:10, y:30)
    }
}

#Preview {
    paddingBootcamp()
}
