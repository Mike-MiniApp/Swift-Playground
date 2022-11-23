//: [Previous](@previous)

import Foundation

let base = 3
let power = 10
var answer = 1
var answer2 = 1

// MARK: ループ内に値を提供しない
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")
