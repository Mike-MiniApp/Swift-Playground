import Foundation
import Security

// プロトコルでプロパティを指定する場合は、varのみ、get、setかを代入しなければならない

protocol testProtocol{
    var getProperty: String { get }
    var getSet: String { get set}

    func ABC()
}

class Test: testProtocol{
    var getProperty: String = "get"

    var getSet: String{
        get{
            return "getSet"
        }
        set{
            getProperty = newValue
        }
    }

    func ABC() {
        print(getProperty)
        print(getSet)
    }
}

let test = Test()
test.ABC()
