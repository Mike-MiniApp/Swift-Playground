import UIKit
/*コールバックについて
コールバックがよく使用されるシチュエーション
・通信後の非同期処理
・共通の処理後に別々の処理をしたい
・ViewModelのロジック処理後などにレイアウト処理をしたい
*/

// MARK: 通常のメソッド
func calculateNumber(){
    let num1: Int = 3
    let num2: Int = 4
    let result = num1 + num2
    print("\(result)\n")
}

// 実行
calculateNumber()
print("MARK: コールバック関数")

// MARK: コールバックを使用したメソッド
func callBack(completion: () -> Void){
    let num1: Int = 3
    let num2: Int = 4
    let result = num1+num2
    print("1: resultの結果は\(result)")
    completion()
}

callBack {
    print("2: コールバック処理が呼ばれる\n")
}

print("MARK: 引数があるコールバック関数")
// MARK: 引数があるコールバックを使用したメソッド
func callBack2(completion: (Int) -> Void){
    let num1: Int = 3
    let num2: Int = 4
    let result = num1 + num2
    print("1: resultの結果は\(result)")
    completion(result)
}

callBack2 { result in
    let result2 = result*2
    print("2: resultを2倍した数は\(result2)")
}


func method(num: Int) -> Int{
    let result = num*2
    return result
}

method(num: 3)
