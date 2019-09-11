import UIKit

func square(number: Int) -> Int {
    return number * number
}
func five() -> Int {
    return 5
}
func fullName(first: String, last: String) -> String {
    return first + " " + last
}
func shout(this message: String) -> String {
    return message + "!"
}
func numberName(spell number: Int) -> String {
    //let numbers: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let numberSpelled: [String] =
        ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    if (-1 < number && number < 10) {
        return numberSpelled[number]
    } else {
        return "nil"
    }
}

print(square(number: five()))
print(fullName(first: "Reed", last: "Wilson"))
print(shout(this: "What up homie"))
print(numberName(spell: 4))
print(numberName(spell: 15))
