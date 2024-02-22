//
//  AddView.swift
//  Zodo
//
//  Created by zizo on 22/02/2024.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var note:String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    var body: some View {
        ScrollView () {
            VStack() {
                TextField("Add Your Note Here ...", text: $note)
                    .padding()
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
            } .padding()
            
            Button(
                action: {
                    /// Good practice: Never put any logic in the view screen.
                    guard validate(note: note) else {return}
                    listViewModel.addTodo(title: note)
                    note = ""
                    presentationMode.wrappedValue.dismiss() /// after adding the todo, return to the todo screen.
                },
                label: {
                    Text("Save".uppercased())
                }
            ) /// end of the button
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.accent)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .font(.headline)
            .padding(.horizontal, 15)
        }
        .alert(isPresented: $showAlert, content: {
            showAlert(title: alertTitle)
        })
        .navigationTitle("Add an item  ✒️")
    }
    
    func validate (note: String) -> Bool {
        guard note.count >= 3 else {
            alertTitle = "Please insert a todo with length more than 3 characters."
            showAlert.toggle()
            return  false}
        return true
    }
    func showAlert (title: String) -> Alert  {
        return Alert (title: Text(title))
    }
}

#Preview {
    NavigationView () {
        AddView()
            .navigationTitle("Add an item ✒️")
    }
}
