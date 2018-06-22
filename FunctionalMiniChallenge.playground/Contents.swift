//: Playground - noun: a place where people can play

import UIKit

enum StudentYear: Int {
    case freshman, sophomore, junior, senior
}

struct Student {
    let firstName: String
    let lastName: String
    let id: Int
    let year: StudentYear
    let grade: Int
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.id  = Int(arc4random_uniform(1000))
        self.year = StudentYear(rawValue: Int(arc4random_uniform(4))) ?? .freshman
        self.grade = Int(arc4random_uniform(101))
    }
}

var students: [Student] = [
    Student(firstName: "Sterling", lastName: "Archer"),
    Student(firstName: "Lana", lastName: "Kane"),
    Student(firstName: "Cheryl", lastName: "Tunt"),
    Student(firstName: "Pam", lastName: "Poovey"),
    Student(firstName: "Cyril", lastName: "Figgis"),
    Student(firstName: "Ray", lastName: "Gillette"),
    Student(firstName: "Malory", lastName: "Archer"),
    Student(firstName: "Barry", lastName: "Dillon"),
    Student(firstName: "Ron", lastName: "Cadillac"),
    Student(firstName: "Ross", lastName: "Geller"),
    Student(firstName: "Chandler", lastName: "Bing"),
    Student(firstName: "Rachel", lastName: "Green"),
    Student(firstName: "Joey", lastName: "Tribbiani"),
    Student(firstName: "Monica", lastName: "Geller"),
    Student(firstName: "Phoebe", lastName: "Buffay")
]

// TODO: - Create an array that contains only the freshmen from the student array using the filter function
// version 1: closure has a defined parameter
let freshmen1 = students.filter {
    (student) in
    return student.year == StudentYear.freshman
}

for student in freshmen1 {
    print("\(student.firstName) is a \(student.year)")
}

// version 2: closure's parameter is accessed using $0
let freshmen2  = students.filter {
    return $0.year == StudentYear.freshman
}

for student in freshmen2 {
    print("\(student.firstName) is a \(student.year)")
}

// Note: when putting the closure outside of the parameter list
// (which you can do when it is the last parameter),
// the () can either be kept or dropped since the closure was the only
// parameter.

//let freshmen1 = students.filter() {
//    (student) in
//    return student.year == StudentYear.freshman
//}

//let freshmen2  = students.filter() {
//    return $0.year == StudentYear.freshman
//}

// version 3: putting the closure inside the parameter list
let freshmen3 = students.filter({
    (student) in
    return student.year == StudentYear.freshman
})

for student in freshmen3 {
    print("\(student.firstName) is a \(student.year)")
}

// TODO: - Create an array that contains only the full names (first name concatenated with the last name) from the student array using the map function
// version 1: closure has a defined parameter
let studentNames1 = students.map {
    (student) in
    return student.firstName + " " + student.lastName
}

for name in studentNames1 {
    print(name)
}

// version 2: closure's parameter is accessed using $0
let studentNames2 = students.map {
    return $0.firstName + " " + $0.lastName
}

for name in studentNames2 {
    print(name)
}

// TODO: - Return the average grade from all the students using the reduce function divided by the count

// version 1: using named parameters for closure
// note: the 0 in reduce() is the starting result
// students.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Student) throws -> Result##(Result, Student) throws -> Result#>)
let gradeSum1 = students.reduce(0) {
    (result, student) in
    return result + student.grade
}

let gradeAverage1 = gradeSum1 / students.count
print(gradeAverage1)

// version 2: using $0 and $1 for the closure parameters
// note: the 0 in reduce() is the starting result
// students.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Student) throws -> Result##(Result, Student) throws -> Result#>)
let gradeSum2 = students.reduce(0) {
    return $0 + $1.grade
}

let gradeAverage2 = gradeSum2 / students.count
print(gradeAverage2)

// comparison to non-functional approach
var total = 0
for student in students {
    total += student.grade
}
let average = total / students.count
print(average)



