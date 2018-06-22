//: Playground - noun: a place where people can play

// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID149
// https://appventure.me/2015/10/17/advanced-practical-enum-examples/#sec-1-2

enum StatusCode: Int {
    case success = 200
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
}

func prettyPrint(statusCode: StatusCode) -> String {
    switch statusCode {
    case .success:
        return "\(statusCode.rawValue): Success"
    case .unauthorized:
        return "\(statusCode.rawValue): Unauthorized"
    case .forbidden:
        return "\(statusCode.rawValue): Forbidden"
    case .notFound:
        return "\(statusCode.rawValue): Not Found"
    }
}

let success = StatusCode.success
print(prettyPrint(statusCode: success))

let unauthorized = StatusCode.unauthorized
print(prettyPrint(statusCode: unauthorized))

let forbidden = StatusCode.forbidden
print(prettyPrint(statusCode: forbidden))

let notFound = StatusCode.notFound
print(prettyPrint(statusCode: notFound))

