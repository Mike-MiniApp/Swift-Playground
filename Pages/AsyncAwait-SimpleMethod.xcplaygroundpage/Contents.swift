//: [Previous](@previous)

import Foundation


func hello() async throws -> String {
    return "helloworld"
}

Task {
    do{
        print("1")
        let hello = try await hello()
        print("2")
        print(hello)
    }
    catch {
        print(error.localizedDescription)
    }
    print("3")
}

