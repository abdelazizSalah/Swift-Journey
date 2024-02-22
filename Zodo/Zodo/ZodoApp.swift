//
//  ZodoApp.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

@main
struct ZodoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView() { /// usually we set the root inside a navigation view to make sure that the whole app can work with navigation.
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
