import UIKit

let xrds : [String : Any] = [
    "name": "Crossroads School",
    "foundingYear": 1971,
    "campuses": [
    "Norton",
    "21st Street"]
]

let name0 = xrds["name"]
let name1 = xrds["name"] as! String
let name2 = xrds["name"] as? String

if name2 != nil {
    let unwrappedOptional = name2!
    print("Hello \(unwrappedOptional)")
}

let whatervs = name2 ?? "something else"
print("Hello again, \(whatervs)")

if let unwrapped = name2 {
    print("Hello another time, \(unwrapped)")
}   else {
    print("Well, that didnt work")
}

let bruteForce = name2!
print("Yup, \(bruteForce)")
