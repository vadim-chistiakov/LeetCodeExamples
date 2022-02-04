//
//  FindEmptySeat.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 04.02.2022.
//  Yandex.Market ios interview 

import Foundation

// [1,0,x,y,0,1] -> 2
// [1,0,0,0,0,0,0] -> 6
// 1минимум - свободное
// 1мин - занятое
// 1 [0,1,0]
// [1,1,1,1,1,0] -> 1

// [1,0,0,0,0,1,0,0,0] -> 3
// [0,0,0,1,0,0,0,0,1] -> 3

func findEmptySeat(_ array: [Int]) -> Int {

    var current = 0
    var isFirst = true
    var result = 0
    
    for i in 0..<array.count {
        if array[i] == 0 {
            current += 1
            if isFirst || array.count - 1 == i {
                result = max(result, current)
            } else {
                if current % 2 == 0 {
                    result = max(result, current/2)
                } else {
                    result = max(result, current/2 + 1)
                }
            }
        } else {
            current = 0
            isFirst = false
        }
    }
    
    return result
}
