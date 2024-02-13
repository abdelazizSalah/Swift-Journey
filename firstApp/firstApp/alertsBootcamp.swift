//
//  alertsBootcamp.swift
//  firstApp
//
//  Created by zizo on 14/02/2024.
//

/*
 Primary Button, and Secondary button have a lot of options, you can press . then select the one you want, and they will have a default styling, which looks nice.
 options are:
 default -> looks blue, and it is usually okay
 .cancel -> to cancel the process
 .destructive -> it is usually delete -> it has a red color.
 */
import SwiftUI

struct alertsBootcamp: View {
    @State var backGroundColor: Color =  Color.orange
    @State var showAlert: Bool = false
    @State var messageTitle: String = ""
    @State var messageDescription: String = ""
    @State var alertType: alertTypes? = nil
    enum alertTypes {
        case error
        case success
    }
    var body: some View {
        ZStack() {
            /// background
            backGround
            /// content
            content
        }
    }
    
    var backGround: some View {
        backGroundColor.ignoresSafeArea()
    }
    
    var content: some View {
        HStack {
            Button("Button 1") {
                alertType = alertTypes.success /// this is the most convnient way to use enums
                self.messageTitle = "ERROR UPLOADING THE VIDEO"
                self.messageDescription = "The video couldn't be uploaded 😓"
                self.showAlert.toggle()
            }
            Button("Button 2") {
                alertType = alertTypes.error
                self.messageTitle = "VIDEO is Uploaded Successfully".uppercased()
                self.messageDescription = "Your Video is now public 🥳"
                self.showAlert.toggle()
            } 
            
            
        } .alert(isPresented: $showAlert, content: alertUsingEnum ) // now it looks more netter.
    }
    
    func alertUsingEnum () -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text ("There was an error"))
        case .success:
            return Alert (title: Text("The Video is uploaded successfully"))
        case nil:
            return Alert (title: Text("No Idea what is going on"))
        }
    }
    
    func defaultAlertContent () -> Alert {
        return Alert (title: Text(messageTitle), message: Text (messageDescription).font(.title), dismissButton: .default(Text("OK")))
    }
    
    func getAlertContent () -> Alert {
        //            Alert(title: Text("There was an error!"))
        return  Alert(
            title: Text(messageTitle), // this is the main title of the error
            message: Text(messageDescription), // this is the description of the error
            primaryButton: .destructive(
                Text("Change to indogo"),
                action: {
                    self.backGroundColor = Color.indigo
                }
            ), // this is the right button
            //                primaryButton: .default(Text("OK")), // this is the right button
            secondaryButton: .cancel(
                Text("Change to Orange"), // if we are going to use the action, then we must provide a Text at the begin.
                action: {
                    self.backGroundColor = Color.orange
                })) // this is the left button
    }
}

#Preview {
    alertsBootcamp()
}
