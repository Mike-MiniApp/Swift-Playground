//: [Previous](@previous)

import UIKit
// MARK: Int型のextension
extension Int{
    var isValid: Bool{
        self % 2 == 0
    }
}

var number: Int = 3
number.isValid

// MARK: プロトコルに適合
struct Person{
    var name: String
    var age: Int
}

protocol EvenAgeCheckable{
    var isEvenAge: Bool { get }
}

extension Person: EvenAgeCheckable{
    // EvenAgeCheckableに適合しているので、記載必須
    var isEvenAge: Bool {
        // Personにageプロパティがあることが前提
        age % 2 == 0
    }
}

var MikeKondo = Person(name: "mikeKondo", age: 25)

MikeKondo.isEvenAge // ageが奇数の時はfalseが出力される
