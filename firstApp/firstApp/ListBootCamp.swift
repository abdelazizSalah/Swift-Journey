//
//  ListBootCamp.swift
//  firstApp
//
//  Created by zizo on 13/02/2024.
//
/*
 List technically is a VStack, however it is very powerful when we want to be able add, remove or edit items in this list.
 
 Edit Button exists by default, it allows you to add, delete, or move items.
 to be able to delete, you need to use .onDelete,
 to be able to move, you need to use .onMove
 
 the styles may be different depending on the device.
 */

import SwiftUI

struct ListBootCamp: View {
    @State var fruits: [String] = ["Apples", "Bananas", "Oranges" ,"Peachs"]
    @State var veggies: [String] = ["Tommato", "Potato", "Carrots" ,"Cucumbers"]
    var body: some View {
        NavigationView {
            List {
                Section(
                    header: HStack {
                        Text ("Fruit").font(.title).foregroundStyle(Color.orange)
                        Image(systemName: "flame.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.red)
//                            .overlay(Color.red)
                    }
                ) {
                    
                    ForEach(fruits, id: \.self) { fruit in /// this is how we use the for each items, instead of accessing using the index.
                        Text(fruit.capitalized.uppercased()).frame(maxWidth: .infinity).background(Color.green)
                            .foregroundColor(.white).font(.title2).padding(.all, 5) /// this is where things gets cooler ;)
                    }
                    
                    .onDelete(// this code, makes items inside the list dismissable.
                        perform: delete
                    )
                    .onMove(perform: move) // this is a shorter way to make the code more cleaner.
                    
                    .listRowBackground(Color.yellow) // this is how we change the background color.
                   
                } // the default style is the Inset Grouped Style
                
                Section(
                    header: Text ("Veggies")
                ) {
                    
                    ForEach(veggies, id: \.self) { veggy in /// this is how we use the for each items, instead of accessing using the index.
                        Text(veggy.capitalized.uppercased())
                    }
                    
                }
            }
            .accentColor(.purple)
//            .listStyle(PlainListStyle()) // this is applied on the list, not on the sections.
            .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(), trailing: AddButton )
            
            
            
        }
        .accentColor(.pink) // this is how we change the color of tools, leading and trailing and things like this.
    }
    
    var AddButton: some View {
        Button("Add", action: add)
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet) // indexSet, is already come with the onDelete
    }
    
    func move(indices:IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add () {
        fruits.append("Coconuts")
    }
}

#Preview {
    ListBootCamp()
}
