//: [Previous](@previous)

import UIKit

// MARK: mapの基本使用（書き方1と書き方2は基本同じ）
// 配列を定義
var array = [1,2,3,4,5]

// 書き方1: 各要素の配列を5倍する
let newArray = array.map { element in
    element*5
}
newArray

// 書き方2: 各要素の配列を5倍する
let newArray2 = array.map({$0 * 5})
newArray2

// キーバリュー型の配列
var tempArray = ["Tokyo": 40,"Sendai": 30,"Kagoshima": 20]
tempArray["Tokyo"]
var newTempArray = tempArray.map { element in
    element.value + 10
}
newTempArray
