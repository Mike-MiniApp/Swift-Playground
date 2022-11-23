// 参照先：https://qiita.com/REON/items/ef01d4180d6befe643ac
import UIKit
// CustomStringConvertibleはcaseのreturnをstringで返すプロトコル
enum NetworkError: Error, CustomStringConvertible{
    case unknown
    case invalidResponse
    case invalidURL

    var description: String{
        switch self{
        case .unknown: return "不明なエラーです"
        case .invalidResponse: return "不正なレスポンスです"
        case .invalidURL: return "不正なURLです"
        }
    }
}

struct Github: Codable{
    let created_at: String
    let login: String
    let name: String
}

class APIClient{
    func sendRequest(success: @escaping (Github) -> (),failure: @escaping (Error) -> ()){
        guard let requestURL = URL(string: "https://api.github.com/users/mikekondo") else{
            // もしrequestURLがnilだったら、invalidURLエラーをfailure closureに渡し、処理を終える
            failure(NetworkError.invalidURL)
            return
        }
        // URLRequestの作成
        let request = URLRequest(url: requestURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // もしエラーだったら、errorをfailure closureに渡し、処理を終える
                failure(error)
                return
            }
            guard let data = data else {
                // もしサーバーから何もデータが返ってこなかったら、unknownエラーをfailure closureに渡し、処理を終える
                failure(NetworkError.unknown)
                return
            }
            do{
                let github = try JSONDecoder().decode(Github.self, from: data)
                success(github)
            } catch(let error){
                failure(NetworkError.invalidResponse)
                print(error)
            }
        }
        task.resume()
    }
}

let api = APIClient()
api.sendRequest { github in
    print(github)
} failure: { error in
    print(error)
}


