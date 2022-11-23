//: [Previous](@previous)

import UIKit
import Foundation

struct Songs: Codable{
    let results: [Song]
}

struct Song: Codable{
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}

// MARK: APIClient
class APIClient {
    private let url = URL(string: "https://itunes.apple.com/search?term=oneokrock&entity=song&contry=jp")!

    func fetchSong() async throws -> Songs {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Songs.self, from: data)
    }
}

let apiClient = APIClient()

// ここではTaskと書いておけば非同期で動くと思っていただけると。。笑
Task {
    do {
        let songs = try await apiClient.fetchSong()
        for i in 0...songs.results.count {
            print("artistName:",songs.results[i].artistName)
            print("trackName:",songs.results[i].trackName)
        }
    }catch {
        print("エラーを受け取りました:",error.localizedDescription)
    }
}

