//
//  darkModeBootCamp.swift
//  firstApp
//
//  Created by zizo on 17/02/2024.
//

/*
 primary and secondary colors are changing automatically, adapting the dark mode,
 while the static colors are not adaptable.
 */

import SwiftUI

struct darkModeBootCamp: View {
    @Environment(\.colorScheme) var colorScheme /// this is how I know whethere the used theme is light or dark.
    
    var body: some View {
        NavigationView() {
            ScrollView {
                Text("This is the PRIMARY text")
                    .foregroundStyle(Color.primary)
                Text("This is the SECONDARY text")
                    .foregroundStyle(Color.secondary)
                Text("This is the Black text")
                    .foregroundStyle(Color.black)
                Text("This is the white text")
                    .foregroundStyle(Color.white)
                Text("This is color is globally adaptive")
                    .foregroundStyle(.notification) // these are the customized colors.
                Text("This is color is locally adaptive")
                    .foregroundStyle( colorScheme == .dark ? .red : .yellow) // these are the customized colors.
            } .navigationTitle("Dark mode bootcamp")
        }
    }
}
//
struct darkModeBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            darkModeBootCamp()
                .preferredColorScheme(.light)
            darkModeBootCamp()
                .preferredColorScheme(.dark)

        }
    }
}

//#Preview {
//    Group {
//        darkModeBootCamp()
//            .preferredColorScheme(.dark)
//        darkModeBootCamp()
//            .preferredColorScheme(.light)
//        
//    }
//}
