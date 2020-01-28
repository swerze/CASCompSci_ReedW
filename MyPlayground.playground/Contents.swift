import UIKit

struct Item {
    let name: String
    let category: String
    let type: String
    let price: Int
}

let myList: [Item] = [
    Item(name: "Action Contraption", category: "Consumable", type: "Healing", price: 50),
    Item(name: "Hello Kitty", category: "Consumable", type: "Healing", price: 30),
    Item(name: "Red Mio", category: "Consumable", type: "Enhancing", price: 0),
    Item(name: "Green Mio", category: "Consumable", type: "Poisonous", price: 0),
    Item(name: "Ping Pong Paddle", category: "Weapon", type: "Melee", price: 20),
    Item(name: "Foosball Ball", category: "Weapon", type: "Projectile", price: 5),
    Item(name: "Chess Pieces", category: "Weapon", type: "Trap", price: 15)
]

func sortByPrice(a: Item, b: Item) -> Bool {
    return a.price < b.price
}

let sortedList = myList.sorted(by: sortByPrice)

for item in sortedList {
    print("\(item.name)")
}
