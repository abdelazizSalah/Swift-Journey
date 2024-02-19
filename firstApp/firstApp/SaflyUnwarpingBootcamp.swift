//
//  SaflyUnwarpingBootcamp.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

/*
    Usually we use this method, whenever we have something which may have nil value, any struct which of type optional.
 
    it is prefered to never use ! mark even if you are 100% sure that there will never be nil value, it is always better to use if let and guard statements.
 
 */
import SwiftUI

struct SaflyUnwarpingBootcamp: View {
    @State var displayString: String? = nil
    @State var loaded: Bool = false /// instead of using the bool, we can use the optional type
    var body: some View {
        NavigationView () {
            VStack() {
                Text("Here we are practicing Safe coding")
                whichContent
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear(
                perform: {
                    loadData()
                    loadData2()
                }
            )
        }
    }
    
    var whichContent : 
    some View {
//        VStack () { // if we removed VStack it will give error because it will not find something to return because we provide only if condition.
            /// whenever we want to get something from backend, we should show progressView indicator, till the data is ready to be loaded. :D
//            if loaded {
//                Text(displayString)
//            } else {
//                ProgressView()
//            }
            
            /// this is how we can do the exact same above logic using if let.
            if let text = displayString {
                return AnyView(Text(text)) // lw galk mushkelt el uncompaitable types, e3ml 7war el casting bta3 AnyView da, aw embed it gowa VStack htshtghl.
            } else {
                return AnyView (
                    ProgressView()
                )
            }
//        }
       
    }
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            loaded = true
            self.displayString = "This is the new data"
        })
    }
    
    func loadData2() {
        guard let contentData = displayString  else  {
            return}  // here we need to check that loaded = false do the beneath logic, if not, just return
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            loaded = true
            self.displayString = "This is the new data"
        })
    }
}

#Preview {
    SaflyUnwarpingBootcamp()
}
