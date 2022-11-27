//: [Previous](@previous)

import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = ["Candy Bar": Item(price: 12, count: 7),
                     "Chips": Item(price: 10, count: 4),
                     "Pretzels": Item(price: 7, count: 11)
    ]

    var coinsDeposited = 0

    func vend(name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count = -1
        inventory[name] = newItem
        print("Dispensing\(name)")
    }
}

let vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8 // コイン投入額

do{
    try vendingMachine.vend(name: "Chips")
}
catch VendingMachineError.invalidSelection {
    print("無効な選択です")
}
catch VendingMachineError.outOfStock {
    print("在庫切れです")
}
catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("お金が足りません。あと\(coinsNeeded)コイン投入してください")
}
catch {
    print("予期しないエラー,\(error)")
}


