//: [Previous](@previous)

import UIKit

class Item {
    private var name: String
    private var price: Int

    init(name: String,price: Int) {
        self.name = name
        self.price = price
    }

    public func getName() -> String {
        return name;
    }

    public func getPrice() -> Int {
        return price
    }

    public func setName(name: String) {
        self.name = name;
    }

    public func setPrice(price: Int) {
        self.price = price;
    }
}

class Paper: Item {
    private var size: String
    private var number: Int

    init(size: String,number: Int,name: String,price: Int){
        self.number = number;
        self.size = size;
        super.init(name: name, price: price)
    }

    public func getSize() -> String {
        return size
    }

    public func getNumber() -> Int {
        return number
    }

    public func setSize(size: String) {
        self.size = size
    }

    public func setNumber(number: Int) {
        self.number = number
    }
}

let paper = Paper(size: "200cm", number: 1, name: "コピー用紙", price: 100)

print("paperの名前: ",paper.getName())
print("paperのサイズ:",paper.getSize())
print("paperの価格:",paper.getPrice())
print("paperのナンバー:",paper.getNumber())




