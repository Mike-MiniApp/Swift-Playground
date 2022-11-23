//: [Previous](@previous)

import UIKit
import Foundation

struct Qiita: Codable{
    let title: String
    let updated_at: String
    let user: User
}
struct User: Codable{
    let id: String
    let description: String
}

let pageCount: Int = 5

let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=\(pageCount)")!

var qittas = [Qiita]()


// MARK: URLSession Start
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print(error)
        return
    }

    guard let data = data, let response = response as? HTTPURLResponse else {
        print("data or response is nil")
        return
    }
    do{
        let qitta = try JSONDecoder().decode([Qiita].self, from: data)
        for i in 0..<pageCount{
            print("タイトル:",qitta[i].title)
            print("更新日:",qitta[i].updated_at)
            print("ユーザid:",qitta[i].user.id)
            print("ユーザ詳細",qitta[i].user.description)
        }
    }catch(let error){
        print("情報の取得に失敗しました",error)
    }
}

task.resume()


