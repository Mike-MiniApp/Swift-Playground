//: [Previous](@previous)

import Foundation
import UIKit
import Darwin

// MARK: Model
struct Qitta: Codable{
    let title: String
    let updated_at: String
    let user: User
}

struct User: Codable{
    let id: String
    let description: String
}

// MARK: URLSession Method
func fetchQittaData(url: URL,completion: @escaping ([Qitta]?,Error?) -> Void){
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("error",error)
            return
        }
        guard let data = data , let response = response as? HTTPURLResponse else {
            print("dataが取得できませんでした")
            return
        }
        do{
            let qittaData = try JSONDecoder().decode([Qitta].self, from: data)
            completion(qittaData,nil)
        }catch(let error){
            print("情報の取得に失敗",error)
        }
    }
    task.resume()
}

let pageCount: Int = 3

let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=\(pageCount)")!

// MARK: 実行
fetchQittaData(url: url) { qittaData, error in
    if let error = error {
        print("失敗")
    }
    print(qittaData)
}
