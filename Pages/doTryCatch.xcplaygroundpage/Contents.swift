import UIKit

// do try catchってなんのために使うの？
// 結論：エラー処理のために使う
// Swiftでは実行時に発生するエラーを、Errorプロトコルで扱う
// エラーを投げるためには下記のように書く
// throw NSError(domain: String, code: Int, userInfo: [String : Any]? = nil)

// エラーを投げる可能性があるメソッドは、メソッドの定義にthrowsキーワードを書く
func printText(text: String) throws{
    if text.isEmpty{
        throw NSError(domain: "error", code: -1, userInfo: nil)
    }
    print(text)
}

// printTextメソッドを使用したエラー対処

// エラーの場合
do{
    try printText(text: "")
}catch{
    print("エラーが発生しました")
}

// エラーでない場合
do{
    try printText(text: "あいうえお")
}catch{
    print("エラーが発生しました")
}


