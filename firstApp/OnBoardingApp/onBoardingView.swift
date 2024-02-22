//
//  onBoardingView.swift
//  firstApp
//
//  Created by zizo on 19/02/2024.
//

import SwiftUI

struct onBoardingView: View {
    enum onBoardingStates {
        case welcome
        case addName
        case addAge
        case addGender
    }
    
    // MARK: State variables
    @State var onBoardingState: Int = 0
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = "Male"
    @State var buttonText: String = "Sign in"
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    /// for app storage
    @AppStorage ("name") var currentUserName: String?
    @AppStorage ("age") var currentUserAge: Int?
    @AppStorage ("gender") var currentUserGender: String?
    @AppStorage ("signed_in") var isSignedIn : Bool = false /// this is exactly the defined in the last screen, but we just need to declare it in this screen too.
    
    // MARK: Constant variables
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View {
        ZStack() {
            
            Color.clear
            ZStack() {
                switch(onBoardingState) {
                    case 0:
                        welcomeView
                        .transition(transition)
                    case 1:
                    VStack() {
                        addNameSection
                        .transition(transition)
                        Spacer()
                            .frame(height: 200)
                    }
                    case 2:
                        addAgeSection
                        .transition(transition)
                    case 3:
                        addGenderSection
                        .transition(transition)
                    default:
                        ProfileView()
                }
            }
            .zIndex(1.0)
            .padding()
            VStack() {
                Spacer ()
                bottomButton
                
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
        
    }
}

// MARK:  COMPONENTS
extension onBoardingView {
    /// we can not define any storage variables inside the extension, they must be defined in the original View
    
    private var bottomButton: some View  {
        Text (buttonText.uppercased())
            .font(.headline)
            .foregroundStyle(.purple)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                //TODO: Here in click we should do something.
                handleNextButtonPressed()
            }
    }
    
    private var welcomeView: some View {
        VStack(spacing: 40) {
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(width: 200, height: 200)
            
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule()
                        .frame(height: 3)
                        .foregroundStyle(.white)
                        .offset(y:5),
                    alignment: .bottom)
            
            Text ("This is the #1st app for finding your match online!, In this tutorial we are practicing using AppStorage and other SwiftUI techniques")
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    }
    
    private var addNameSection : some View {
        VStack(spacing: 20) {
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            TextField("Your text should be here...", text: self.$name)
                .font(.headline)
                .padding(.horizontal)
                .padding()
                .background(Color.white)
                .foregroundStyle(.purple)
                .cornerRadius(25)
            
        }.padding(.horizontal)
    }
    private var addAgeSection : some View {
        VStack(spacing: 20) {
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Text("\(String(format:"%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Slider(
                value: self.$age,
                in: 18...80,
                step: 1)
            .accentColor(.white) /// this is how we can change the color of the slider.
            
        }.padding(.horizontal)
    }
    private var addGenderSection : some View {
        VStack(spacing: 20) {
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Picker(
                selection: $gender,
                label:
                    Text("Select a gender")
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20),
                content: {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                })
            .pickerStyle(.menu)
            .padding(.all, 5)
            .padding(.horizontal, 15)
            .background(.white)
            .cornerRadius(25)
            
        }.padding(.horizontal)
    }
}

// MARK: FUNCTIONS
extension onBoardingView {
    func handleNextButtonPressed () {
        // Check inputs
        switch onBoardingState {
        case 1 :
            guard name.count >= 3 else {
                showAlert(title: "You have to enter a name longer than 3 chars")
                return /// if not 3, just do not do anything.
            }
            
            break
        case 3:
            signIn()
            
        default:
            break
        }
        
        // Go to next section
        withAnimation(.spring()) {
            buttonText = onBoardingState == 2 ? "finish": "next"
            onBoardingState += 1 // go to the next state.
        }
    }
    
    func showAlert (title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn () {
        currentUserGender = gender
        currentUserAge = Int(age)
        currentUserName = name
        withAnimation(.spring) {
            isSignedIn = true
        }
    }
}

#Preview {
    onBoardingView()
}

