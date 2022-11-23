//: [Previous](@previous)

import UIKit
import Foundation

var name: String = "MikeKondo"

UserDefaults.standard.set(name, forKey: "nameKey")

if let saveNameData = UserDefaults.standard.object(forKey: "nameKey"){
    print(saveNameData)
}

