//: [Previous](@previous)

import Foundation

// MARK: エラーの定義
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

struct Songs: Codable{
    let results: [Song]
}

struct Song: Codable{
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}


// MARK: APIClient
class APIClient{
    func fetchSong(url: URL,completion: @escaping(Songs?, Error?) -> Void){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil,error)
                return
            }

            guard let data = data else {
                print("data or response is nil")
                completion(nil,NetworkError.unknown)
                return
            }
            guard let songs = try? JSONDecoder().decode(Songs.self, from: data) else {
                completion(nil,NetworkError.invalidResponse)
                return
            }
            completion(songs,nil)
        }
        task.resume()
    }
}

let apiClient = APIClient()
let url = URL(string: "https://itunes.apple.com/search?term=oneokrock&entity=song&contry=jp")!

apiClient.fetchSong(url: url) { songs,error  in
    if let error = error {
        print("error",error)
    }
    guard let songs = songs else { return }

    for i in 0...songs.results.count {
        print("artistName:",songs.results[i].artistName)
        print("trackName:",songs.results[i].trackName)
    }
}


