//
//  ProfileView.swift
//  firstApp
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage ("name") var currentUserName: String?
    @AppStorage ("age") var currentUserAge: Int?
    @AppStorage ("gender") var currentUserGender: String?
    @AppStorage ("signed_in") var isSignedIn : Bool = false /// this is exactly the defined in the last screen, but we just need to declare it in this screen too.
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text ("Your Name is \(currentUserName ?? "Unknown")")
            Text ("Your Are \(currentUserAge ?? 0) Years Old")
            Text ("Your gender is \(currentUserGender ?? "Unknown")")
            
            Spacer()
                .frame(height: 40)
            Text ("Sign Out")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.blue.opacity(0.9))
                .cornerRadius(20)
                .foregroundStyle(.white)
                .frame(height: 55)
                .onTapGesture {
                    signOut()
                }
        }
        .multilineTextAlignment(.center)
        .shadow(color: .blue.opacity(0.1),  radius: 20, y: 10)
        .font(.title)
        .padding()
        .padding(.vertical, 20)
        .padding(.horizontal, 20)
        .background(.white)
        .foregroundStyle(.blue.opacity(0.7))
        .cornerRadius(10)
    }
}

//MARK: Functions
extension ProfileView {
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        isSignedIn = false
        
    }
}

#Preview {
    ProfileView()
}
