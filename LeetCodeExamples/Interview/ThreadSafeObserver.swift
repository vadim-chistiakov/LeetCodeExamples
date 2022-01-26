//
//  ThreadSafeObserver.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 14.01.2022.
//

import Foundation

protocol Observer: AnyObject {
    func observe(event: String, object: Any?, notificationCenter: ConcurrentNotificationCenter)
}

protocol Observable {
    func add(_ observer: Observer, forEvent event: String)
    func remove(_ observer: Observer, forEvent event: String)
    func post(event: String, object: Any?)
    func hasObserver(_ observer: Observer, forEvent event: String) -> Bool
}

final class WeakObserver: NSObject {
    
    weak var observer: Observer?
    
    init(_ observer: Observer) {
        self.observer = observer
    }
}

class ConcurrentNotificationCenter: Observable {
    static let shared = ConcurrentNotificationCenter()
    
    private var observers = [String: Set<WeakObserver>]()
    private let sinkQueue = DispatchQueue(label: "queue.sink.com", attributes: .concurrent)
    
    private init() {}

    func add(_ observer: Observer, forEvent event: String) {
        sinkQueue.async(flags: .barrier) {
            if var values = self.observers[event], !values.contains(WeakObserver(observer)) {
                values.insert(WeakObserver(observer))
                self.observers[event] = values
            } else {
                self.observers[event] = [WeakObserver(observer)]
            }
        }
    }

    func remove(_ observer: Observer, forEvent event: String) {
        sinkQueue.async(flags: .barrier) {
            if var values = self.observers[event], values.contains(WeakObserver(observer)) {
                values.remove(WeakObserver(observer))
                self.observers[event] = values
            }
        }
    }
    
    func post(event: String, object: Any?) {
        sinkQueue.sync {
            guard let values = observers[event] else { return }
            for value in values {
                value.observer?.observe(event: event, object: object, notificationCenter: self)
            }
        }
    }
    
    func hasObserver(_ observer: Observer, forEvent event: String) -> Bool {
        sinkQueue.sync {
            guard let values = observers[event] else { return false }
            return values.contains(WeakObserver(observer))
        }
    }
}


class ThreadSafeObserverTests {

    static func test() {
        let notificationCenter = ConcurrentNotificationCenter.shared

        var listener: Listener! = Listener()
        print("count1: \(CFGetRetainCount(listener))")

        notificationCenter.add(listener, forEvent: "test")
        notificationCenter.add(listener, forEvent: "test1")
        print("count2: \(CFGetRetainCount(listener))")

        notificationCenter.post(event: "test", object: "testObject")
        listener = nil
        notificationCenter.post(event: "test1", object: "testObj")
        notificationCenter.post(event: "tes", object: "testObj")
        
        guard let listener = listener else { return }
        print("count3: \(CFGetRetainCount(listener))")
    }
}

class Listener: Observer {
    func observe(event: String, object: Any?, notificationCenter: ConcurrentNotificationCenter) {
        print("recieved \(event) for object \(String(describing: object))")
    }
}
