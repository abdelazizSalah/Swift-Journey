//
//  ListView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct ListView: View {
    @State var todos: [String] = [
        "This is the first item",
        "This is the second item",
        "This is the third item",
    ]
    var body: some View {
        List ()
        {
            ForEach (todos, id: \.self) { todo in
                ListRowView(todo: todo)
            }
        }
    }
}

#Preview {
    NavigationView () {
        ListView()
            .navigationTitle("Todo List 📝")
    }
}

