/*
 クロージャとは？
 ・無名関数とよく呼ばれる
 ・クロージャの有用性：他の関数に処理を渡せる
 @escaping が非同期処理という意味らしい　クロージャーがスコープから抜けてもクロージャが存在するという意味
*/


import UIKit

// MARK: 通常の関数
func sum(a: Int,b: Int) -> Int{
    return a+b
}
sum(a: 10, b: 20)

// MARK: クロージャ（基本形）
let sum2 = {(a: Int,b: Int) -> Int in
    return a + b
}
sum2(10,20)

// MARK: クロージャ（return省略系)
let sum3 = {(a: Int,b: Int) -> Int in
    a + b
}
sum3(10,20)

// MARK: クロージャ（引数省略ver）
let sum4: (Int,Int) -> Int = {
    (a: Int,b: Int) -> Int in
    a + b
}
sum4(10,20)

// MARK: クロージャ（引数省略ver2）
let sum5: (Int,Int) -> Int = {
    (a,b) -> Int in
    a + b
}
sum5(10,20)

// MARK: クロージャ（引数省略ver3)
let sum6: (Int,Int) -> Int = {
    a,b -> Int in
    a + b
}
sum6(10,20)

// MARK: クロージャ（$を使用）
let sum7: (Int,Int) -> Int = {
    $0 + $1
}
sum7(10,20)

// MARK: クロージャ（返り値がvoid）
var free: ((Int) -> Void) = {
    a in
    print(a)
}

free(10)

struct User {
    var name: String
}

// 下記だと同期的な書き方なのでUser情報を返せない
//func download() -> User {
//    DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: {
//
//    })
//}

// escapingをつけることでdownloadfuncの後に非同期的にcompletionを実行することを明記している
func download(completion: @escaping (User) -> Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: {
        let user = User(name: "kondo")
        completion(user)
    })
}
download { (user: User) in
    print(user)
}

