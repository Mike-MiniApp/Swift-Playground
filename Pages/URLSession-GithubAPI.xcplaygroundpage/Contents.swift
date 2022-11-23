//: [Previous](@previous)

import UIKit
import Foundation

struct Github: Codable{
    let created_at: String
    let login: String
    let name: String
}

let url = URL(string: "https://api.github.com/users/mikekondo")!
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print(error.localizedDescription)
        return
    }
    guard let data = data, let response = response as? HTTPURLResponse else {
        print("data or response is nil")
        return
    }
    do{
//        let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//         print(json)
        let github = try JSONDecoder().decode(Github.self, from: data)
        print(github)
        print(github.created_at)
        print(github.login)
        print(github.name)
    } catch(let error){
        print("情報の取得に失敗しました",error)
    }
}

task.resume()
