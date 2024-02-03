var name0 : String = "zizo has installed the simulator successfully"
print(name0)

print(type(of: name0))
var q:Int = 3
print(type(of: q))
//var name: String = "zizo now knows how to run playgrounds"
var age:Int = 19
let constantVal = 1013 // this is how we define constants in swift


// if we declared a variable of certain type, we can not change its type.
//name = 9, this should cause an error.

class Person {
    var name:String;
    var age:Int;
    var height:Int;
    var weight:Int;
    init(age: Int, height: Int, weight: Int, name: String) {
        self.age = age
        self.name = name
        self.height = height
        self.weight = weight
    }
}

import UIKit
import Foundation
var button1: UIButton = UIButton()
var isComplete: Bool = false

/// now lets talk more about functions and parameters.
func myFirstFunc () {
    
}

func parameterizedFunc (x:Int,y:Int) ->Int {
    return x + y ;
}

func isEven(x :Int) -> Bool {
    return x % 2 == 0
}

func showIfConditions (a:Int) -> Int {
    if a == 1{
        return 1
    } else if a == 2 {
        return 2
    }
    else{
        return 3
    }
    return 4
}

// calling this function
var a = 3
var b = 10

// a & b are called arguments, while x & y are the function's parameters
var sum = parameterizedFunc(x: a, y: b)


// now lets talk somehow about classes.
class Vehicle {
    
}


class Car : Vehicle {
   // Defining the data members
    var make:String
    var color = "blue";
    var model = "";
    func drive(){
        
    }
    // the construcor here is called an initializers.
    // this here is called self.
    init (color: String, make:String, model:String){
        self.color = color
        self.model = model
        self.make = make
    }
    
    func setMake(make: String) ->  Void {
        self.make = make
    }
}
//
//struct Car : Vehicle {
//    let make:String
//    var color = "blue";
//    var model = "";
//    func drive(){
//        
//    }
//    // the construcor here is called an initializers.
//    // this here is called self.
//    init (color: String, make:String, model:String){
//        self.color = color
//        self.model = model
//        self.make = make
//    }
//}
/*
 Interview quesiton......
 What is the difference between struct and class?
 class is a reference type
 while struct is a value type.
 what the hell does this mean ?
 it means that: whenever you create a copy of the same object
 like
 car1 = Car()
 car2 = car
 in case of struct, if we made changes in car2, it won't be reflected back into car1.
 however, in the case of the classes, it is sent by reference, so any change in car2 will be reflected in car1, and viceversa.
 */



/// now lets talk about loops.
/// 1. for loop
/// 2. while loop
/// 3. do .. while loop
/// 4. for each loop.

let numbers = [1,2,3,4,5,6,7]
print("test") // this is how we print things.
for number in numbers{ // it is similar to python.
    print(number)
}

var xl = 0
while xl < 10 {
    print(xl)
    xl += 1
}


/// Optionals and unwrapping
/*
 Optional means that the defined variable may or maynot contain a value.
 it is a data type.
 we use it to be able to assign the values to nil, because as we mentioned before, once we declare a type, we can not change it, so if we used the normal way of defining varibales, we wont be able to assign the value nil, so to do so we just use the ?, similar to what we do in dart.
 you have to notice that, int? is completely different than int
 if we have int? x, int? y, we can not simply apply x + y, there will be a compilation error.
 to be able to do the summation we need to use the unwrapping logic.
 */
var something: String? = "ahmed" // nil here is same as null.
something = nil

// unwrapping
var x :Int? = 2
var y :Int? = 9

// this is how we apply the unwrapping method.
if let value = x {
    if let value1 = y {
        var result = value + value1
        print(result)
    }
}

/// Gaurd statements
/*
 these are similar to if statements
 */
// if z = 20 do something, else z = 20
var z = 12
//guard z == 20 else { print("z is not 20") ; break }
// do something should be here.
print(z)
func numbersLargerThanFive (number:Int)->Bool{
    guard number > 5, number > 4 else{ return false }
    
    return true
}


/// ENUms and switch statements
/*
    Why do we need enums?
 Actually we can replace enums by manually assigning the values by ourselfs.
 however, it is very usefull to use enums, to avoid case senstivity mistakes, moreover, it makes the code more clear.
 
 */
enum States {
    case InProgress
    case Aborted
    case Complete
    case willStart
}

// we can assign the dataType of the enum
enum Names : String {
    case Ahmed = "Ahmed", Mohammed = "Mohammed", Tamer = "Tamer"
}

// how to access the values?
var current :States?
current = .InProgress // this is a short cut for States.

/// how to access the values of the case?
var name : String
name = Names.Ahmed.rawValue

// Now lets talk about switch statements
func checkCases (current: States?) {
    switch current {
    case .Aborted:
        print("Aborted")
        break
        
    case .InProgress:
        print("InProgress")
        break
    case .Complete:
        print("Completed")
        break
    case .willStart:
        print("will Start")
        break
    default:
        print("Nil")
    }
}


/// now lets talk about protocols
/*
  Protocol is a contract or a bluePrint
 
 it holds the variables and methods, but only their names, not their definitions.
 It is the abstract classes. :D
 any class that promise to inherit this protocol, must override the abstract functions defines in the defintion.
 So this is same to the interface in Java, and abstract classes in C++.
 
 usually the protocols, will be in name convention like
 ...DataSource
 ...Delegate
 
 what are these names?
 delegate and datasource are a naming convention that apple came up with around ten years age, so they are just a naming conventions, and 99% are used for protocols.
 */
protocol CarProtocol {
    var colorpp: String { get set } // this imply that any class that will inherit this CarProtocol, must create a setter and getter for the variable color.
    func drive()
    func isAllWheelDrive() -> Bool
}


class BMW: Car, CarProtocol {
    var colorpp:String = "blue"
    
    var colorPropetry: String {
        get {
            return self.colorpp
        }
        set (newValue) {
            self.colorpp = newValue
        }
    }
    init(color: String) {
        super.init(color: "Blue", make: "BMQ", model: "2024")
        self.colorpp = color
    }
    func setColor (color: String) {
        self.colorpp = color
    }
    func getColor () -> String {
        return self.colorpp
    }
    
    override func drive () {
        
    }
    func isAllWheelDrive() -> Bool {
        return true
    }
}



/// strong vs Weak in the memory manegement
/*
 when you create a variable, we store its value inside the memory.
 so usually we want to tell the program, when to get rid of that variable, when it is no longer needed.
 so this is called memory management.
 
 How to use both?
 we just put prefix weak to the var if we want to define it as weak, however, if we didn't declared it, it is strong by default.
 
 Story to understand this concept
 Imagine there is a boy with a helium balloon, the boy is the strong variable and the balloon is the weak variable.
 that is because if the boy disapperd, this imply that the balloon will also disapear, because no one will be holding it, so it will fly away, while if the ballon disapeared, this does not imply that the child has also disapeard, because he might get rid of it, and he is standing in the street.
 So, to put it in a nutshell, the weak variable will disapear, if there is no strong variable pointing at it.
 
 Why we would care about something like this?
 Because when we are on a mobile device, there is a limited memory, so we must be conscious about how do we manage the memory in the device, to avoid wasting the memory of the user device, as this highly affect the performance.
 */

class Child {
//    weak var balloon:String;
//    init(balloon: String) {
//        self.balloon = balloon
//    }
}

var joe = Child ()


 /// now lets talk about closures.
/*
 it is similar to lambda function.
 it is a function that can be passed around.
 
 Why we would like to use this?
 because this allows us to send functions as arguments for another functions, which may help us in certain situations.
 
 */

func isGreaterThanThree (x: Int) -> Bool {
    guard x > 3 else {return false}
    return true
}

var myFunction: ((Int) -> Bool)? // this is how we define the closure.

myFunction = { number in // this is how we define the name of the integer.
    guard number > 3 else {return false}
    return true
}

if let myFunction=myFunction // and this is how we can
{
    if myFunction(5) == true{
        print(5)
    } else {
        print (10)
    }
}
var voidFunc : ((String, Int) -> ())? // empty brackets indicate void
voidFunc = {str, number in
    if str.starts(with: "Ahmed")  && number == 3 {
        print(str)
        print(number)
    }
}

print("gell")
if let voidFunc = voidFunc {
    voidFunc("Ahmed", 3)
}

/// now lets talk somehow about strings.
var myString : String? = "AbdelazizSalah"

if let name = myString {
    print (name)
}
// functions with strings
var first:String = "Abdelaziz"
var last: String = "Salah"
var digit: Int = 5
let fullName = "my Name is : \(first) \(last) and my fav digit is \(digit)"
print(fullName)


/// we need to do a check on string functions.
// to get the length we use ,.count
var length = fullName.count
print(length)

// lowerCase
print (fullName.uppercased())
print (fullName.lowercased())
print(fullName.hasPrefix("my Name"))
print(fullName.hasPrefix("my Nams"))
print(fullName.hasSuffix("is \(digit)"))
print(fullName.hasSuffix("my Nams"))


var string1 = "Ahmed"
var string2 = "Ahmed"
var string3 = "ahmed"

if(string1 == string2){
    print(string1)
}
print(string1 == string3)
print(string1 == string2)
print(string1.caseInsensitiveCompare(string3) == .orderedSame) // this is because it returns an enum, so we need to check on its value.

/// Now lets dive into Arrays and dictionaries.
/// lets check how to declare array
//var firstArray = [1,2,3,4,"Ahmed"] we can not declare heterogenous arrays in the normal way.
var anotherArray:[String] = ["Ahmed", "Mohammed", "Salem"]

// to define heterogenous array
var heterogenous:[Any] = [1,2,3, "Ahmed", 5, 7] // now it works

for item in heterogenous{
    if item is Int { // this is how we check on the datatype of the variable.
        print(item)
    }
}

/// now lets define dicts.
var cars:[String:Int] = ["bmw":3, "Honda":1, "Mercedes":1]
for (key, value) in cars {
    print (key)
    print(value)
}


/// Numbers
var aI = 1 // Int
var aD = 1.009999 // Double -> Doubles are represented in 64 bits
var aF = 1.0000000000001 // Float -> Floats are represented in 32 bits

var result = aI + Int(aD)

print(aD)


/// Libraries and frameworks.
/// what the heck are those?
/// they are a group of functions, variables, and classes, that contains things that facilitate writing codes.
/// naming convention,  usually most libraries will end with Kit, and usually they are upper-camel-case.
///
//import Foundation -?> Strings, ints, doubles, etc...
//import UIKit
//import UI


let button = UIButton()

/// TypeAliases
/// What are these?
/// They are a way to give another name to the standard DataTypes
/// similar to using ll = long long which we usually use in cpp
/// it is usually used to shorten the names of the datatypes.
/// moreover, we can assign it to different values
/// uusually we write them above the statement
typealias Code = String
typealias dbl = Double
typealias flt = Float
typealias addressDT = [String : String]
var address: addressDT = ["Maadi":"City", "Location":"newYork"]

// instead of this
//var validateFunction = ((String) -> (Bool))?
/// uusually we write them above the statement to enhace the readability.
typealias PromoCodeValidationFunction = ((String) -> (Bool))?
var validateFunction: PromoCodeValidationFunction

/// ternary operators, and return statements
/// ternary operators are -> condition ? inCaseOfTrue : inCaseOfFalse
/// we use it to shorten the code.

func isBiggerThanFive(number:Int) -> Bool {
    let result = number > 5 ? true : false
    return result
// the above code is similar to this.
//    if number > 5 {
//        return true
//    } else {
//        return false
//    }
}

/// By Reference vs By Value
/// In Swift sending items by reference or by value, depends on the dataaType of the sent arguments
/// so it send items by value, if thier datatypes where Structs, Enums, or primitive datatypes, such as  Int, Floats, Doubles, etc....
/// While it sends them by reference if they were things like, Classes, Functions, or Closures.
/// This is a critical point, because it affects the performance of the code, and how you will handle the data.


/// Now lets talk somehow about math library
var xM = 9
var yM = 20.9

// since they are of different data types, we can not apply math operations on them.

var zM = 30
var mod = 2
print( zM % mod == 0) // if true, then the number if even.


/// recursion
func normalAdd(x: Int) -> Int {
    if x == 1 {
        return 1
    }
    return x + normalAdd(x: x - 1)
}

print(normalAdd(x: 10))

func sameAddUsingMath (x:Int) -> Int{
    return (x * (x+1)) / 2
}
print(sameAddUsingMath(x: 10))


/// searching and sorting
/// usually we use built in methods for this.

var unsortedArr:[Int] = [1,2,4,1,5,2,0,-10,-1]
unsortedArr.sort() // this have sorted the items.
for item in unsortedArr{
    print(item)
}

func binarySearch (sortedArr:[Int], trgt:Int) -> Bool{
    var bgn = 0
    var end = sortedArr.count - 1
    var md = (bgn + end) / 2
    while bgn <= end {
        if sortedArr[md] == trgt{
            return true
        }
        if sortedArr[md] < trgt {
            bgn = md + 1
        } else {
            end = md - 1
        }
        md = (bgn + end) / 2
    }
    return false
}
binarySearch(sortedArr: unsortedArr, trgt: 19)

/// now we have covered most of the basics of swift.
/// Summary

protocol AddressDataSources {
    func myAddress () -> String
}

class Neighbourhood {
    let homes:[Home]
    
    init(homes: [Home]) {
        self.homes = homes
    }
}

class Home: AddressDataSources {
    let rooms:[Room]
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    func myAddress() -> String {
        return "123 Main Street"
    }
}

class Room {
    var color = "blue"
    var width = 12
    var length = 32.5
    func isOnSecodFloor () -> Bool {
        return false
    }
    init(color: String = "blue", width: Int = 12, length: Double = 32.5) {
        self.color = color
        self.width = width
        self.length = length
    }
    func getArea() -> Int {
        return self.width * Int(self.length)
    }
}
