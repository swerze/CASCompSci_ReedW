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
    if number != 7 {
        return "nil"
    } else {
        return "seven"
    }
}

print(square(number: five()))
print(fullName(first: "Reed", last: "Wilson"))
print(shout(this: "What up homie"))
print(numberName(spell: 7))
print(numberName(spell: 4))
