//
//  ObservableObjectsBootCamp.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
 @StateObject and @ObservableObject
    they are properties which allows us to observe variables in other classes and update our views based on their values in real time.
 And they reference objects in other classes.
 
 
 */

import SwiftUI

struct fruitsModel : Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

/// Always try to apply the single responsiblity concept while designing your application.
/// so here all the logic in this class has nothing to do with the view struct, so it is much better to separate it in another class as we actually did now.
class FruitsViewModel : ObservableObject {
    /// @Published is same as @State but inside the class, because we can not use @State in classes, we use it only in the View structs.
    /// it alerts the class that the content has changed.
    @Published var fruits : [fruitsModel] = [ ]
    @Published var isLoading: Bool = true
    init() {
        getFruits()
    }
    
    func getFruits () {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.addFruit(name: "Apples", count: 10)
            self.addFruit(name: "Oranges", count: 12)
            self.addFruit(name: "Watermelons", count: 100)
            self.addFruit(name: "Banans", count: 40)
            self.isLoading = false
        })
    }
    func addFruit (name: String, count: Int) {
        fruits.append(fruitsModel(name: name, count: count))
    }
    
    func deleteFruit (index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}

struct ObservableObjectsBootCamp: View {
    /// now if we didn't added @observedObject, we will find that things are not working, that is because we are not telling the view that this variable should update the view on its change, however after declaring it, we now telling the view that this is a new whole object, and we need to observe its changing.
    /// to can use this, we must declare the type of FruitsViewModel as ObservableObject
    /// more notes to consider, that whenever the screen is reloaded, this object will be reconstructed, and reloaded, and sometimes this is not what we want
    /// that is why they created @StateObject, which is exactly the same as @ObservedObject, but when the UI is reloaded, the data will persist, and not be affected.
    /// so as a rule of thumb
    ///     @StateObjects -> USE THIS ON FIRST CREATION / INITS
    ///     @ObservedObject -> USE THIS ON THE SUBVIES.
//    @ObservedObject var fruitsModel : FruitsViewModel = FruitsViewModel()
    @StateObject var fruitsModel : FruitsViewModel = FruitsViewModel()
    var body: some View {
        NavigationView {
            
            List ( ) {
                if fruitsModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        
                }
                ForEach(fruitsModel.fruits) { fruit in
                    HStack() {
                        Text("\(fruit.count)")
                            .foregroundStyle(.gray)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                    
                }
                .onDelete(perform: fruitsModel.deleteFruit) /// always we append the .onDelete at the end of certain foreach. -> inside the List.
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: RandomScreen(fruitsViewModel: fruitsModel),
                        label: {Image(systemName: "arrow.right")}
                    )
            )
            
            .navigationTitle("Fruit Lists")
//            .onAppear() {
//                fruitsModel.getFruits() /// now this is not working.
//            }
            
        }
    }
    
}

struct RandomScreen: View {
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var fruitsViewModel : FruitsViewModel
    var body: some View {
        ZStack () {
            Color.gray.ignoresSafeArea()
            
            VStack() {
                ForEach(fruitsViewModel.fruits) { fruit in
                    Text(fruit.name)
                }
            }
            
//            Button(
//                action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Text ("Go Back")
//                        .font(.largeTitle)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.white)
//                }
//                
//                
//                )
        }
    }
}

#Preview {
    ObservableObjectsBootCamp()
//    RandomScreen()
}
