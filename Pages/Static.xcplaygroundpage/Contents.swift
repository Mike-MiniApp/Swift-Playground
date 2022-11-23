// static: 「静的変数」と呼ばれるもの
// そもそも静的とは？　静的とは、あらかじめ与えられた状態などが変化しないことや、状況に通じて一貫して内容が保持されること
// static(静的）と動的変数の挙動から差異を学ぶ
import UIKit

class noodle{
    // 本日のオーダー数（静的変数である）
    static var order = 0

    static func printHello() {
        print("ようこそラーメン店へ")
    }

    // お客が替え玉した時の皿の数（動的変数である）
    var sara = 0

    // 売り上げをカウントしていく
    func uriage(){
        noodle.order += 1
        print("本日\(noodle.order)杯目の注文が入りました")
    }
    func kaedama(){
        sara += 1
        print("替え玉を\(sara)回したので皿は\(sara)枚です。")
    }
}

noodle.printHello()

var okyakusan = noodle()
okyakusan.uriage()
okyakusan.kaedama()

var okyakusan2 = noodle()
okyakusan2.uriage()
okyakusan2.kaedama()

print("合計のオーダー数は",noodle.order)



// 実行してわかること
// クラス（noodleクラス）を初期化してインスタンスを生成しても、再度インスタンスが生成されない変数のことを静的変数と呼ぶ。
// 再度インスタンスが生成されないから静的という意味なのか！！でもstatic letとletで違いが出るのだろうか？orderをいじれなくして試そう！
