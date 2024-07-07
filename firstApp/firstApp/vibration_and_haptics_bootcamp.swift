//
//  vibration_and_haptics_bootcamp.swift
//  firstApp
//
//  Created by zizo on 06/07/2024.
//

import SwiftUI

/// this class is responsible for applying vibration
class HapticManager {
    static let vibratorInstace = HapticManager () // to follow Singleton desgin pattern
    
    func notification (type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact (notificationStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: notificationStyle)
        generator.impactOccurred()
    }
}

struct vibration_and_haptics_bootcamp: View {
    @State private var counter = 0
    var body: some View {
        VStack {
          
            Button("success") { HapticManager.vibratorInstace.notification(type: .success) }
            Button("warning") { HapticManager.vibratorInstace.notification(type: .warning) }
            Button("error") { 
                HapticManager.vibratorInstace.notification(type: .error)
                for i in 0 ..< 5000 {
                    HapticManager.vibratorInstace.impact(notificationStyle: .heavy)
                   
                }
//                for i in 0 ..< 1500 {
//                    HapticManager.vibratorInstace.impact(notificationStyle: .rigid)
//                    HapticManager.vibratorInstace.notification(type: .error)
//                } 
//                for i in 0 ..< 1500 {
//                    HapticManager.vibratorInstace.impact(notificationStyle: .light)
//                    HapticManager.vibratorInstace.notification(type: .error)
//                }
                
            }
            Divider()
            
            Button("soft") { HapticManager.vibratorInstace.impact(notificationStyle: .soft ) }
            Button("light") { HapticManager.vibratorInstace.impact(notificationStyle: .light ) }
            Button("medium") { HapticManager.vibratorInstace.impact(notificationStyle: .medium ) }
            Button("rigid") { HapticManager.vibratorInstace.impact(notificationStyle: .rigid) }
            Button("heavy") { HapticManager.vibratorInstace.impact(notificationStyle: .heavy) }
        }
    }
}

#Preview {
    vibration_and_haptics_bootcamp()
}
