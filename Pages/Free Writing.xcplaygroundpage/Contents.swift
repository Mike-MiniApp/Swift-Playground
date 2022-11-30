//: [Previous](@previous)

import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    let price: Int
    let count: Int
}

class VendingMachine {
    let productArray = ["りんごジュース": Item(price: 100, count: 3),
                        "みかんジュース": Item(price: 200, count: 2),
                        "マンゴージュース": Item(price: 300, count: 5)]

    let coins: Int

    init(coins: Int) {
        self.coins = coins
    }

    func vend(name: String) throws {
        guard let item = productArray[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard coins >= item.price else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coins)
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        print("\(name)は\(item.price)円で購入されました")
    }
}

let vendingMachine = VendingMachine(coins: 400)

do{
    try vendingMachine.vend(name: "りんごジュース")
}catch VendingMachineError.invalidSelection {
    print("商品名が無効です")
}catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("\(coinsNeeded)円不足しています")
}catch VendingMachineError.outOfStock {
    print("在庫が不足しています")
}
