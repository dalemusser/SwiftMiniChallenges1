import UIKit

func check(value: Int) -> String? {
    if (value <= 0) {
        return nil
    } else {
        return String(value)
    }
}

let numberString1: String? = check(value: 10)
let numberString2: String? = check(value: 0)
let numberString3: String? = check(value: -2)

