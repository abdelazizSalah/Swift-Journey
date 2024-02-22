//
//  ListRowView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI


struct ListRowView: View {
    var todo: ItemModel
    var body: some View {
        HStack() {
            Image(
                systemName :  todo.isDone ? "checkmark.circle" : "circle" )
            .foregroundStyle(todo.isDone ? .green : .red)
            Text (todo.title)
            Spacer()
        }
        .font(.title2)
        .padding(.all, 8)
        
    }
}

#Preview {
    
        NavigationView() {
            ListRowView(todo: ItemModel(title: "This is the first item", isDone: false))
        }
    
}
#Preview {
    
        NavigationView() {
            ListRowView(todo: ItemModel(title: "This is the first item", isDone: true))
        }
    
}
