// Dale Musser - dale@dalemusser.com
// https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
// https://docs.swift.org/swift-book/LanguageGuide/Closures.html
// https://www.andrewcbancroft.com/2017/04/26/what-in-the-world-is-an-escaping-closure-in-swift/
// https://medium.com/@kumarpramod017/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d

import UIKit

struct MathOperation {
    var units: String
    var operation: (Double, Double) -> Double
    
    // without @escaping we get "Assigning non-escaping parameter 'operation' to an @escaping closure".
    // The closure is being stored to be used later outside of the init(), so it is escaping and has to be marked as such.
    // If the closure was only going to be called in the init() when the init() is executed after receiving the closure, then it would not be escaping.
    
    init?(units: String, operation: @escaping (Double, Double) -> Double) {
        self.units = units
        self.operation = operation
    }
}

// The following are examples of using the struct and the closure in the struct.

// Example 1

var distance = MathOperation(units: "km", operation: {
    (x, y) in
    return x + y
})

// distance is optional and needs to be unwrapped to use because MathOperation init is failable and yields an optional
if let distance = distance {
    let sum = distance.operation(12.5, 22.4)
    let units = distance.units
    print("\(sum) \(units)")
}

// Example 2

let multiply = {
    (a: Double, b: Double) in
    return a * b
}

var volume = MathOperation(units: "square meters", operation: multiply)

// volume is optional and needs to be unwrapped to use because MathOperation init is failable and yields an optional
if let volume = volume {
    let result = volume.operation(10.0, 20.0)
    let units = volume.units
    print("\(result) \(units)")
}

// Example 3

func divide(i: Double, j: Double) -> Double {
    return i/j
}

var speed = MathOperation(units: "km/hr", operation: divide)

if let speed = speed {
    let result = speed.operation(150.0, 2.0)
    let units = speed.units
    print("\(result) \(units)")
}

