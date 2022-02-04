//
//  LongestPalindrome.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 01.02.2022.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count < 2 {
        return s
    }
    
    let arr = Array(s)
    var low = 0
    var max = 0
    
    for index in 0..<arr.count {
        checkSubstring(arr, index, index, &low, &max)
        checkSubstring(arr, index, index+1, &low, &max)
    }
    return String(arr[low..<max+low])
}

private func checkSubstring(_ arr: [Character],
                            _ i: Int,
                            _ j: Int,
                            _ low: inout Int,
                            _ max: inout Int) {
    var x = i
    var y = j
    
    while (x >= 0 && y < arr.count && arr[x] == arr[y]) {
        x -= 1
        y += 1
    }
    
    if max < y - x - 1 {
        max = y - x - 1
        low = x + 1
    }
}
