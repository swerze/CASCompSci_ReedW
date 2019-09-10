import UIKit

func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
}

let yourName = "Reed"

let firstVowel = getFirstVowel(in: yourName)

var unwrappedVowelOne: String
if let unwrapped = getFirstVowel(in: yourName) {
    unwrappedVowelOne = unwrapped
} else {
    unwrappedVowelOne = "swag"
}

var unwrappedVowelTwo: String = (getFirstVowel(in: yourName) ?? "swag")

var unwrappedVowelThree: String = firstVowel!

print("The first vowel in '\(yourName)' is '\(unwrappedVowelOne)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelTwo)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")
