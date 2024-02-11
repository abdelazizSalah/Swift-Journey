//
//  InitsAndEnumsBootCamp.swift
//  firstApp
//
//  Created by zizo on 10/02/2024.
//

/*
 Now we will start make our application more dynamic :D.
 
 inits is an abriviation for initializers, a function that run to set up the View.
 similar to the constructors.
 
 The main benfit of that, is instead of having a hard coded elements inside our widgets, we can call these values dynamically, so we can store the elements, outside of the body, and whenever the screen is built, the correct data should be passed to the view.
 
 To make it required, we should define a variable with no default value, so every time we need to build the screen, the language will ask us to pass the value corresponding to this variable.
 
 And to give the value, you need to pass its value in the constructor of the struct
 InitsAndEnumsBootCamp(backGroundColor: Color.yellow
 
 enums is an abriviation for enumerators, it is a code which allows you to categorize your elements, in numeric way, so you say that number 0 is Apple, number 1 is Oranges, and so on.ººº
 
 
 NOTES: Shortcuts:
 command + 0 -> open or close the Navigator.
 command + option + 0 -> open or close the inspector.
 command + N -> new file.
 command + f -> select text to search, select next using command + G.
 command + option + [ -> move line of code up.
 command + option + ] -> move line of code down.
 command + shift + L -> show library. 
 control + k -> cut the whole line.
 control + I -> formate the code.
 control + space -> show all possible options in any widget.
 option + click on widget to see the documentation.
 they are very useful
 */
import SwiftUI

struct InitsAndEnumsBootCamp: View {
    /// enums
    enum Fruits {
        case Apple
        case Mangos
    }
    
    /// this is a better way to define the data inside the screen.
    //    let backGroundColor: Color  = Color.blue;
    var backGroundColor: Color;
    let numberOfElements: Int;
    let typeOfTheElements:Fruits
    
    /// this is created by defualt, if we did not write it, this is the constructor of the struct.
    init(numberOfElements: Int, typeOfTheElements: Fruits) {
//        setColor(typeOfElement: typeOfTheElements)
        if typeOfTheElements == Fruits.Apple {
            self.backGroundColor = .red
        } else{
            self.backGroundColor = .orange
        }
        self.numberOfElements = numberOfElements + 3 // but we can modify the logic as we want.
        self.typeOfTheElements = typeOfTheElements
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(numberOfElements)")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
                .underline()
            Text(typeOfTheElements == .Apple ? "Apples" : "Mangos")
                .font(.headline)
                .foregroundStyle(Color.white)
            
        }
        .frame(width: 150, height: 150)
        .background(backGroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack{
        InitsAndEnumsBootCamp( numberOfElements: 6, typeOfTheElements: .Apple)
    InitsAndEnumsBootCamp( numberOfElements: 3, typeOfTheElements: .Mangos)}
}

