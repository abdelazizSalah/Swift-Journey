//
//  ItemModel.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import Foundation

/*
    Codable allows me to convert my object from and into JSON object.
 And the idea behind this conversion is to be able to send and recieve these objects in the UserDefaults or in the App Storage.
 Usually we use the App Storage or User defaults in case of using the cache, and we should store small items like user name, email, password, and so on, however, when dealing with bigger apps, we should connect our application with real huge data base to store our data on a server instead of filling the small memory of our device.
 
 */
struct ItemModel: Identifiable, Codable {
    let id : String
    let title: String
    let isDone: Bool
    
    /// we use this constructor to be able to create new object with an existing id, instead of creating new id in each time.
    init(id: String = UUID().uuidString, title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    func updateCompletion () -> ItemModel {
        return ItemModel(id:self.id, title: self.title, isDone: !isDone)
    }
}
