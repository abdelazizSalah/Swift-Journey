//
//  ListView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack() {
            if listViewModel.todos.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
            } else {
                List ()
                {
                    ForEach (listViewModel.todos) { todo in
                        //                Text(todo.title)
                        ListRowView(todo: todo)
                            .onTapGesture(count: 2) {
                                withAnimation(.bouncy()){
                                        listViewModel.updateItem(item: todo)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteTodo)
                    .onMove(perform: listViewModel.moveTodo)
                }
                
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: listViewModel.todos.isEmpty ? nil : EditButton(),
            trailing: listViewModel.todos.isEmpty ? nil :  NavigationLink(destination: AddView(), label: {Text("Add")})
        )
    }
}

#Preview {
    NavigationView () {
        ListView()
            .navigationTitle("Todo List 📝")
    }.environmentObject(ListViewModel())
}


