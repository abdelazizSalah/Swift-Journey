//
//  ListViewModel.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import Foundation

/*
    Here we implemented the basic CRUD operations.
 C -> Create
 R -> Read
 U -> Update
 D -> Delete
 
 */

class ListViewModel: ObservableObject {
    @Published var todos: [ItemModel] = [] {
        didSet {
            /// this didSet is similar to didChanged in flutter, which allow me to call a methods, or do some logic whenever the data inside this list is changed.
            /// so using this method, we avoid redundancy, and keeping our self DRY.
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        self.getData()
    }
    
    func getData () {
//        let newItems = [
//            ItemModel(title: "This is the first task", isDone: false),
//            ItemModel(title: "This is the second task", isDone: true),
//            ItemModel(title: "This is the third task", isDone: false),
//        ]
//        todos.append(contentsOf: newItems)
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
       
            todos = decodedData
    }
    
    func deleteTodo (index: IndexSet) {
        todos.remove(atOffsets: index)
    }
    
    func moveTodo (from: IndexSet, to: Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo (title: String) {
        guard validateText(text: title) else {return}
        let newItem = ItemModel(title: title, isDone: false)
        todos.append(newItem)
    }
    
    func validateText (text: String) -> Bool {
        return text.count >= 3
    }
    
    func updateItem (item: ItemModel) {
        if let index = todos.firstIndex(where: {$0.id == item.id}) {
            ///$0 is the referencing object which is the first item with our index, and the return of firstIndex is Int? because it might not find the object we are looking for.
            let todoCurrent = todos[index]
            todos[index] = todoCurrent.updateCompletion()
        }
    }
    
    func saveItems () {
        if let encodedData = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
