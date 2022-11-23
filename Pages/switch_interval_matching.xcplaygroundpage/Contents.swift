//: [Previous](@previous)

import Foundation

let approximateCount = 62

let countedThings = "土星を回る月"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "まったくない"
case 1..<5:
    naturalCount = "少しある"
case 5..<12:
    naturalCount = "多少ある"
case 12..<100:
    naturalCount = "数多くある"
case 100..<1000:
    naturalCount = "たくさんある"
default:
    naturalCount = "膨大にある"
}

print(naturalCount)
