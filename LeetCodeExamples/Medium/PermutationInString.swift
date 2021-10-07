//
//  PermutationInString.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 07.10.2021.
//

import Foundation

//Sometimes too slow for tests
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let dict = s1.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] + 1 })
    let str2 = Array(s2)
    var start = 0
    
    while start + s1.count < s2.count + 1 {
        let subString = str2[start..<start+s1.count]
        let subDict = subString.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] + 1 })
        
        if dict == subDict {
            return true
        }
        start += 1
    }
    return false
}

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        
        let s1 = Array(s1), s2 = Array(s2)
        var arr1 = Array(repeating: 0, count: 26), arr2 = arr1, i = 1
        for c in s1 {
            arr1[atoi(c)] += 1
        }
        for c in s2[..<s1.count] {
            arr2[atoi(c)] += 1
        }
        if arr1 == arr2 { return true }
        while i <= s2.count-s1.count {
            arr2[atoi(s2[i-1])] -= 1
            arr2[atoi(s2[i-1+s1.count])] += 1
            if arr1 == arr2 { return true }
            i += 1
        }
        return false
    }
       
    func atoi(_ c: Character) -> Int {
        Int(c.asciiValue! - 97)
    }

}
