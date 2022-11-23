//: [Previous](@previous)

import Foundation

enum BloodType: String{
    case a
    case b
    case ab
}

struct Person{
    let bloodType: BloodType
}

let mikeKondo = Person(bloodType: .a)

switch mikeKondo.bloodType{
case .a:
    print(mikeKondo.bloodType)
case .b:
    print("無し")
case .ab:
    print("無し")
}



