//: [Previous](@previous)

import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    let count: Int
    let price: Int
}

class VendingMachine {
    var inventory = ["オレンジジュース": Item(count: 2, price: 100),
                     "りんごジュース": Item(count: 3, price: 200),
                     "ブドウジュース": Item(count: 5, price: 300)]

    let coinsNeeded: Int

    init(coinsNeeded: Int) {
        self.coinsNeeded = coinsNeeded
    }

    func vend(name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.price <= coinsNeeded else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsNeeded)
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        print("\(name)を\(item.price)円で購入しました")
        let remainMoney = coinsNeeded - item.price
        print("残り\(remainMoney)円です")
    }
}

let vendingMachine = VendingMachine(coinsNeeded: 3000)

do{
    try vendingMachine.vend(name: "りんごジュース")
}
catch VendingMachineError.invalidSelection {
    print("無効な商品名です")
}
catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("\(coinsNeeded)円足りません")
}
catch VendingMachineError.outOfStock {
    print("在庫がありません")
}


