import UIKit

func classifyProduct(multiply firstNum: Int, by secondNum: Int) -> String {
    let newNum = firstNum * secondNum
    if (0 < newNum && newNum < 30) {
        return "\(firstNum) multiplied by \(secondNum) is small"
    } else if (newNum > 30) {
        return "\(firstNum) multiplied by \(secondNum) is big"
    } else if (newNum == 0) {
        return "\(firstNum) multiplied by \(secondNum) is zero"
    } else {
        return "\(firstNum) multiplied by \(secondNum) is negative"
    }
}

print("Welcome to the unhelpful calculator, we only do multiplication here. Kind of.")
print("What numbers would you like to multiply. Separate with --ONLY-- a comma.")

let userString = "3,7"
let userStringList = userString.split(separator: ",")

print(classifyProduct(multiply: Int(userStringList[0])!, by: Int(userStringList[1])!))
