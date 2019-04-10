import UIKit

struct Store {
    
    let name: String
    var electronicHardware: [String]?
    
}

let target = Store(name: "Target", electronicHardware: [
    "iPhone", "iPad", "Flatscreen TVs"
    ])

let bestBuy = Store(name: "Best Buy", electronicHardware: ["Laptops", "Big Fridges"])

let bedBathAndBeyound = Store(name: "Bed Bath & Beyound", electronicHardware: nil)

//let items = target.electronicHardware! + bestBuy.electronicHardware! + bedBathAndBeyound.electronicHardware!

let items2 = [target, bestBuy, bedBathAndBeyound].compactMap { $0.electronicHardware }.flatMap{$0}

print(items2)
