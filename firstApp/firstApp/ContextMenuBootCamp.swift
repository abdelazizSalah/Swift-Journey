//
//  ContextMenuBootCamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

/*
    On holding a component the context menu will apear.
 
 */
import SwiftUI

struct ContextMenuBootCamp: View {
    @State var backGroundColor: Color = Color.purple
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
            Text("Zizo thinking").font(.title)
            Text("How to use context Menu"     ).font(.title)
        }
        .contextMenu(ContextMenu(menuItems: {
            Button(
                action: {
                    self.backGroundColor = .yellow
                },
                label: {
                    HStack() {
                        Text (" Share a post ")
                        Spacer()
                        Image(systemName: "flame.fill")
                    }
                }
            )
            Button(
                action: {
                    self.backGroundColor = .orange
                },
                label: {
                    HStack() {
                        Text (" Report a post ")
                        Spacer()
                        Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
                    }
                }
            )
            Button(
                action: {
                    self.backGroundColor = .red
                },
                label: {
                    HStack() {
                        Text (" Like a post ")
                        Spacer()
                        Image(systemName: "heart.fill")
                    }
                }
            )
        }))
        .padding(20.0)
        .padding()
        .foregroundColor(.white)
        .background(backGroundColor)
        .cornerRadius(20)
        .shadow(color: Color.black, radius: 10, x: 10, y: 10)
       
    }
}

#Preview {
    ContextMenuBootCamp()
}
