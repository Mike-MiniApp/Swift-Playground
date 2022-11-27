//: [Previous](@previous)

import UIKit

// MARK: - Vehicle is superclass
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "走行時速\(currentSpeed)マイル"
    }

    func makeNoise() {
        // 何もしない -　乗り物は必ずしも騒音を出しません
    }
}

let vehicle = Vehicle()
print("乗り物",vehicle.description)



print("----------")
// MARK: - Bicycle is subclass
class Bicycle: Vehicle {
    var hasBasket = false

    override func makeNoise() {
        print("ブンブン")
    }
}

let bicycle = Bicycle()
bicycle.currentSpeed = 15
print("バイク",bicycle.description)
bicycle.makeNoise()



print("----------")
// MARK: - Car is subclass
class Car: Vehicle {
    var gear = 1

    override var description: String {
        return super.description + "でギアは\(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("自動車:\(car.description)")



print("----------")
class AutomaticCar: Car {
    // currentSpeedプロパティを設定するたびに、プロパティのdidSetはgearに新しい速度に低下ギアを選択する
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35.0
print("オートマ車：\(automaticCar.description)")

automaticCar.currentSpeed = 70.0
print("オートマ車：\(automaticCar.description)")



