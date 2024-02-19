//
//  EnviromentVariables.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
    Same thing as @stateObject , but instead of passing them in each screen, we can set them as global variables, so any screen can access them directly.
 
 
 */

import SwiftUI

class EnviromentViewModel: ObservableObject {
    var dataArray: [String] = [ ]
    init () {
        getData()
    }
    func getData () {
        self.dataArray.append(contentsOf: ["IPhone", "IPad", "IMac", "Apple Watch"])
    }
}

struct EnviromentVariables: View {
    @StateObject var envView = EnviromentViewModel()
    var body: some View {
        NavigationView () {
            List {
                ForEach(envView.dataArray, id: \.self) { device in
                        NavigationLink(
                            destination: DetailView(deviceName: device),
                            label: {Text (device)})
                    
                }
            }
            .listStyle(.grouped)
            .navigationTitle("iOS Devices")
        }
        .environmentObject(envView) /// so this is how we can set new enviroment variables.
        
    }
}

struct DetailView : View {
//    @ObservedObject var viewModel: EnviromentViewModel /// now this is completly useless, except we just send it to another screen, so instead of doing this, we can just define it as a EnviromentObject
    let deviceName: String
    var body: some View {
        ZStack() {
            backGround
            content
        }
    }
    
    var backGround : some View {
        Color.gray.ignoresSafeArea()
    }
    
    var content: some View {
        Button(
            action: {
                
            },
            label: {
                NavigationLink(destination: FinalView(), label: {
                    Text(deviceName)
                } )
            }
        )
        .padding()
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(50)
        
    }
}

struct FinalView : View {
    /// Real question here, what if we have many enviroment objects ?
    /// how to access them
    @EnvironmentObject var viewModel: EnviromentViewModel /// we get that object from the enviroment.
    var body: some View {
        ZStack() {
            backGround
            content
        }
    }
    
    var backGround : some View {
        LinearGradient(colors: [Color.purple.opacity(0.6), Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    var content : some View {
        Text ( " This is The final Screen ")
    }
}

#Preview {
    EnviromentVariables()

}
