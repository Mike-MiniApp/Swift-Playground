//: [Previous](@previous)

import Foundation

let numbers = [1,2,3,4]

let mapped = numbers.map { $0*4 }

let flatMapped = numbers.flatMap { $0*4 }
mapped
flatMapped
