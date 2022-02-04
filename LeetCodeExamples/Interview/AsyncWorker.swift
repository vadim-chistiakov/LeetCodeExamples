//
//  AsyncWorker.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 04.02.2022.
//  Yandex.Market ios interview 

import Foundation

final class AsyncWorker {
    func doTheJob(name: String, complete: @escaping (String) -> Void) {
        print(name)
        complete(String(name.first!))
    }
}

extension AsyncWorker {
    func doJobs(names: [String], complete: @escaping ([String]) -> Void) {
        let group = DispatchGroup()
        var result = Array(repeating: "", count: names.count)
        
        group.notify(queue: DispatchQueue.main,
                     execute: {
            complete(result)
        })
        
        for name in names {
            group.enter()
            DispatchQueue.global().async {
                self.doTheJob(name: name, complete: { str in
                    let index = names.firstIndex(of: name) ?? 0
                    result[index] = str
                    group.leave()
                })
            }
        }
        group.wait()
    }
}

func testAsyncWorker() {
    let worker = AsyncWorker()
    let names = ["aa","bb","cc","dd","ee","ff","gg","hh","nn","kk"]

    worker.doJobs(names: names) { array in
        for item in array {
            print(item)
        }
    }
    
}
