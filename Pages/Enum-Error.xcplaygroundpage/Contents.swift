//: [Previous](@previous)

import Foundation
import Security

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

print(NetworkError.unknown)
print(NetworkError.invalidResponse)
print(NetworkError.invalidURL)


