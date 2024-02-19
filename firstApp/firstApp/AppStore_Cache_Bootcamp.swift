//
//  AppStore_Cache_Bootcamp.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
    AppStorage is similar to the caches, we store items on the user device, so when he reopens the application, he should find the last saved data.
 
 */
import SwiftUI

struct AppStore_Cache_Bootcamp: View {
//    @State var currentName : String?
    /// this is similar to UserDefaults, but now we do not need to set and get the elements, we just asign values, and they will be automatically saved in the cache.
    /// All screens can access the same item -> that is very powerful.
    @AppStorage ("name") var currentName: String?
    var body: some View {
        VStack() {
            Text (currentName ?? " No Name ")
            if let name = currentName {
                Text(name)
            }
            Button(
                action : {
                    let name = "Abdelaziz"
                    currentName = name
                    /// this act like a map, cache helper in flutter, we store something, and the key is the forKey.
//                    UserDefaults.standard.set ( name, forKey: "name")
                },
                label:{
                    Text("Save")
                    .foregroundStyle(.black)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(.white)
                    .cornerRadius(20)
                    }
                
            )
                
        }
        .onAppear(
            perform: {
//                currentName = UserDefaults.standard.string(forKey: "name") ?? "No Name"
            }
        )
    }
}

#Preview {
    AppStore_Cache_Bootcamp()
}
