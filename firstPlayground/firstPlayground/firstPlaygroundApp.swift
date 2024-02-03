//
//  firstPlaygroundApp.swift
//  firstPlayground
//
//  Created by zizo on 03/02/2024.
//

//import SwiftUI
//
//@main
//struct firstPlaygroundApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


/*
    @breif about swift
        it is a programming language created by apple back to 2014
        it was meant to replace objective C, which is another old language used for developing ios apps.
 */

// Variables, constants, and statics.
var str = "hello World!"
let const = "constant is defined by let in swift."
class Person {
    // static is similar to constants, something we can not change.
    // moreover, they must exist inside a class, we can not define them gloabally.
    // we need it when we are creating a class, and we want to tell computer, please create multiple instances, but let all of them share this certain variable.
    static var age = 12;
    static func incrementAge() {
        age += 1;
    }
}

var luka = Person()

// Data Types
/*
 Swift contain something called type inferencing, which means that it can dynamically infer what is the
 type of the object you have created
 
 */
var x = 3
var name = "Joe"


