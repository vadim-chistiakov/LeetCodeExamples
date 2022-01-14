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

final class WeakObserver: Hashable {
    
    weak var observer: Observer?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
    
    init(_ observer: Observer) {
        self.observer = observer
    }
    
    static func == (lhs: WeakObserver, rhs: WeakObserver) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

class ConcurrentNotificationCenter {
    static let shared = ConcurrentNotificationCenter()
    
    private var observers = [String: Set<WeakObserver>]()
    private let sinkQueue = DispatchQueue(label: "queue.sink.com", attributes: .concurrent)
    
    private init() {}

    func add(_ observer: Observer, forEvent event: String) {
        sinkQueue.async(flags: .barrier, execute: {
            if var values = self.observers[event], !values.contains(WeakObserver(observer)) {
                values.insert(WeakObserver(observer))
                self.observers[event] = values
            } else {
                self.observers[event] = Set(_immutableCocoaSet: WeakObserver(observer))
            }
        })
    }

    func remove(_ observer: Observer, forEvent event: String) {
        sinkQueue.async(flags: .barrier, execute: {
            if var values = self.observers[event], values.contains(WeakObserver(observer)) {
                values.remove(WeakObserver(observer))
                self.observers[event] = values
            }
        })
    }
    
    func post(event: String, object: Any?) {
        sinkQueue.sync(execute: {
            guard let values = observers[event] else { return }
            values.forEach {
                $0.observer?.observe(event: event, object: object, notificationCenter: self)
            }
        })
    }
    
    func hasObserver(_ observer: Observer, forEvent event: String) -> Bool {
        sinkQueue.sync(execute: {
            guard let values = observers[event] else { return false }
            return values.contains(WeakObserver(observer))
        })
    }
}
