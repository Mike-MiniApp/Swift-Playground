//: [Previous](@previous)

import Foundation

class Subject {
    let eventName: Notification.Name
    var tag = Int()

    init(eventName: Notification.Name) {
        self.eventName = eventName
    }
    // NotificationCenterに登録。これが実行されるとObserver側が処理を実行する
    func post() {
        NotificationCenter.default.post(name: eventName, object: nil)
    }
}

class Observer {
    let eventName: Notification.Name

    init(eventName: Notification.Name) {
        self.eventName = eventName
        NotificationCenter.default.addObserver(self, selector: #selector(doWhenEventOccur(_:)), name: eventName, object: nil)
    }

    // NotificationCenterに登録。SubjectのPostを受け取ったらこのメソッドが実行される
    @objc func doWhenEventOccur(_ notification: Notification) {
        print("イベント発生時に動かしたい処理を記述")
        print("name",notification.name)
    }
}

// イベント名を決定
let eventName = Notification.Name("Event Occurs")

// Subject側とObserver側でイベント名を合わせる
let observer = Observer(eventName: eventName)
let subject = Subject(eventName: eventName)

// イベントの発生
subject.post()

