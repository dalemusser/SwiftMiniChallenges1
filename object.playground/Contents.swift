//Dale Musser - dale@dalemusser.com
// https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
// https://docs.swift.org/swift-book/LanguageGuide/Methods.html

import UIKit

class Dog {
    var name: String
    var owner: String
    var age: Int
    var dogTag: String {
        get {
            return "If lost, call " + owner
        }
    }
    
    init(name: String, owner: String, age: Int) {
        self.name = name
        self.owner = owner
        self.age = age
    }
    
    func bark() {
        print("Woof")
    }
}

let puppy = Dog(name: "Orion", owner: "Shawn", age: 1)
puppy.bark()
print(puppy.dogTag)
