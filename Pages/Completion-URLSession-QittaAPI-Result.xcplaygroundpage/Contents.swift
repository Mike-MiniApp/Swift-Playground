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
func fetchQittaData(url: URL,completion: @escaping (Result<[Qitta],Error>) -> Void){
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("error",error)
            return
        }
        guard let data = data else { return }
        do{
            let qittaData = try JSONDecoder().decode([Qitta].self, from: data)
            completion(.success(qittaData))
        }catch(let error){
            print("情報の取得に失敗",error)
            completion(.failure(error))
        }
    }
    task.resume()
}

let pageCount: Int = 2

let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=\(pageCount)")!

// MARK: 実行
fetchQittaData(url: url) { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

