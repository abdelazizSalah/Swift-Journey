//
//  VoiceOverBootcamp.swift
//  firstApp
//
//  Created by zizo on 05/03/2024.
//

import SwiftUI

struct VoiceOverBootcamp: View {
    @State var isOn: Bool = false
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isOn)
                    HStack () {
                        Text ("Volume")
                        Spacer()
                        Text(isOn ? "True" : "False")
                            /// this allows me to hide this from the user when the voice over is on, so it would not be spelled out.
                            .accessibilityHidden(true)
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isOn.toggle()
                    }
                    /// . combine allows me to put all the children together in one group, so whenever the voice over going to read something on the screen, so it should say all the elements together.
                    .accessibilityElement(children: .combine)
                    /// this tell the user what exactly he is hovering over, so we want to tell him that this is a button, and he should start click on them.
                    .accessibilityAddTraits(.isButton)
                    /// this is a hint to what the user should do, and what is going to happen after he does this.
                    .accessibilityHint("Double tap to toggle Button")
                    /// this is what going to happen, usually it is the same as the normal tap gesture, and it is always a good practice to add it, to be able to make your code readable.
                    .accessibilityAction {
                        isOn.toggle()
                    }
                    .accessibilityValue(isOn ? "is On" : "is Off")
                }header: {
                    Text("Prefrences")
                }
                Section {
                    Button("Favorites") {
                        
                    }
                    /// usually we use this, if we have image, and we use this image as a button, so we remove the trait of image, and insert a trait of button.
                    .accessibilityRemoveTraits(.isButton)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                            /// this changes the default label, to the label we want to be spelled out.
                            .accessibilityLabel("Favorites")
                    }
                    
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            /// do something
                        }
                }header: {
                    Text("Application")
                }
                
                VStack() {
                    Text("CONTENT")
                        .accessibilityAddTraits(.isHeader)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("steve-jobs")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
//                                        .accessibilityRemoveTraits(.isButton)
//                                        .accessibilityAddTraits(.isImage)
                                    
                                    Text("Item \(x)")
                                        .accessibilityLabel("This is item number \(x)")
//                                        .accessibilityHidden(true)
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityRemoveTraits(.isButton)
                                .accessibilityHint(" if you want to open, just double tap")
                                .onTapGesture {
                                    
                                }
                                
                            }
                        }
                    }
                    .accessibilityLabel("This is a List of Buttons")
                    .accessibilityHint("Use three fingers and swipe right or left to scroll the list")
                }
            }
            .navigationTitle("Settings ")
        }
    }
}

#Preview {
    VoiceOverBootcamp()
}
