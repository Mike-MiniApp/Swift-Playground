//: [Previous](@previous)

import Foundation

extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100 }
    var mm: Double { return self / 1000 }
    var ft: Double { return self / 3.28084 }

    func helloworld() {
        print("helloworld")
    }
}

let oneInch = 25.4.km
print("1インチは\(oneInch)メートル")

let mikekondoHeight = 161.cm
print("mikekondoの身長は\(mikekondoHeight)メートル")
print(mikekondoHeight.helloworld())
