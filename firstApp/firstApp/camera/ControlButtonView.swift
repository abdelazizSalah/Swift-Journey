//
//  ControlButtons.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import SwiftUI

struct ControlButtonView: View {
    let label: String
    let action:  () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .tint(.white)
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    ControlButtonView(label: "Cancel", action: {})
}
