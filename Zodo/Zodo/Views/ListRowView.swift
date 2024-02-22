//
//  ListRowView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI


struct ListRowView: View {
    let todo: String
    var body: some View {
            HStack() {
                Image( systemName: "checkmark.circle")
                Text (todo)
            }
    }
}

#Preview {
    
    NavigationView() {
        ListRowView(todo: "This is the first item")
    }
}
