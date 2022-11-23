import UIKit
import Darwin

// 型を明示しないEnum
enum MikeOrigin{
    case mike1
    case mike2
    case mike3
}

// String型を継承したEnum
enum Weather: String {
    case sunny = "晴れ"
    case cloudy = "曇り"
    case rain = "雨"
    case snow = "雪"
}

//let mikeOrigin = MikeOrigin(RawValue)

// 型を明示するEnum
enum CalculationMethod: Int{
    case add
    case sub
    case mult
    case div
}

let cal = CalculationMethod(rawValue: 3)
switch cal{
case .add:
    print("add")
case .div:
    print("div")
case .mult:
    print("mult")
case .sub:
    print("sub")
case .none:
    break
}

let weather = Weather.snow
switch weather {
case .sunny:
    print(weather)
case .cloudy:
    print(weather)
case .rain:
    print(weather)
case .snow:
    print(weather)
}

