//
//  ActionSheetsBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

import SwiftUI

struct ActionSheetsBootCamp: View {
    @State var showActionSheet: Bool = false
    var body: some View {
        /// lets create an instagram template
        
        NavigationView {
            VStack {
                HStack() {
                    Circle()
                        .frame(width: 50)
                        .padding(.leading, 10)
    //                    .padding(.trailing, 5)
                    NavigationLink("@UserName",  destination:{
                        
                        ZStack() {
                            Color.gray.ignoresSafeArea()
                            Text("Profile Screen")
                        }
                    }
                    )
                Spacer()
                    Button(
                        action: {
                            self.showActionSheet.toggle()
                        },
                        label: {
                            Image(systemName:"ellipsis").font(.title2)
                                .padding(.trailing, 10)
                        }
                    )
                    .actionSheet(isPresented: $showActionSheet, content: showActionSheetFunc)
                    
                } /// end of HStack
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
               
            }
        }
    }
    
    func showActionSheetFunc () -> ActionSheet
    {
        let button1: ActionSheet.Button = .default(Text("Defualt"))
        let button2: ActionSheet.Button = .destructive(Text("destructive"))
        let button3: ActionSheet.Button = .cancel(Text("cancel"))
        
        return ActionSheet(title: Text("This is the title"), buttons:
                            [button1, button2, button3, button2, button2, button1, button1, button1] /// we can not have more than 1 cancle button in the list
        )
    }
    
}

#Preview {
    ActionSheetsBootCamp()
}
