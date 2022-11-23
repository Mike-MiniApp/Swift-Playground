//: [Previous](@previous)

import Foundation

// ClassとStructの違い
// Classは参照型でStructは値型である

// 参照型
class Fish {
    var name: String
    init(name: String){
        self.name = name
    }
    func fishNameChange(name: String){
        self.name = name
    }
}

let fish = Fish(name: "sweetFish")
fish.name = "tuna" // fishがletでも変更できる
fish.name
let fishClass = fish
fishClass.name = "hekou"
fish.name

/* 参照型は値型と異なり値を直接メモリ上の変数領域には格納せず、
 値があるアドレスを変数領域に格納するため、
 letで定義したオブジェクトでもプロパティの要素が持っているアドレス先の要素を変更することで更新できる*/

// 値型
struct Fish2 {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let fish2 = Fish2(name: "sweetFish")
// fish2.name = "tuna" // エラー


// どう使い分ける？
/*
 状態が必要：Class
 特定のオブジェクトを継承する：Class
 代入時にコピーを渡す：Struct
 */
