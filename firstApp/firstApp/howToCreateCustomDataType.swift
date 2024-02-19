//
//  howToCreateCustomDataType.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
    models like we create in flutter, it is so easy, we just need to represent more complex data type like person object or things customized, so we just create a new struct, and start using it.
 
 */

import SwiftUI

/*
    Identifiable is used to make us able to use forEach, and it can access some unique element for each item
 
 */
struct UsersModel: Identifiable {
    let id: String = UUID().uuidString /// this gives an automatic generated ID by swift
    let userName: String
    let displayName: String
    let isVerified: Bool
    let numberOfFollowers: Int
}

struct howToCreateCustomDataType: View {
    @State var users : [UsersModel] = [
        UsersModel (userName: "Abdelaziz123", displayName: "Abdelaziz Salah", isVerified: true, numberOfFollowers: 1000),
        UsersModel (userName: "Malak", displayName: "Luka", isVerified: true, numberOfFollowers: 1000),
        UsersModel (userName: "Kiro", displayName: "Kirollos Samy", isVerified: false, numberOfFollowers: 20),
        UsersModel (userName: "Karim", displayName: "Kemoos", isVerified: false, numberOfFollowers: 522),
        UsersModel (userName: "Abdelaziz123", displayName: "No3", isVerified: true, numberOfFollowers: 321),
    
    ]
    var body: some View {
        NavigationView () {
            List() {
                ForEach(users) { user in
                    HStack( spacing: 20.0) {
                        Circle()
                            .frame(height: 50)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer ()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        VStack() {
                        Text("\(user.numberOfFollowers)")
                                .font(.headline)
                            
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                            
                    }
                    .padding(.vertical, 10.0)
                   
                    
                    
                }
            }.navigationTitle("Users")
        }
        
    }
}

#Preview {
    howToCreateCustomDataType()
}
