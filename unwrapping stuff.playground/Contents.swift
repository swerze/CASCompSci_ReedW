import UIKit

var painInTheButt: Int? = 100
//painInTheButt = nil
var newValue: Int

if painInTheButt != nil {
    newValue = painInTheButt! + 100 //exclamationmark
} else {
    newValue = 100
}

var anotherNewValue: Int

if let unwrapped = painInTheButt {
    anotherNewValue = unwrapped + 1000
} else {
    anotherNewValue = -50
}

let yetAnotherValue: Int = (painInTheButt ?? 7) * 2000 //questionmarks

//3 ways to unwrap an optional: !, ??, assign to unwrapped
