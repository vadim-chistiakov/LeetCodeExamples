//
//  WordBreak.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 01.11.2021.
//  https://leetcode.com/problems/word-break/submissions/
//  Difficult


import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let wordDict = Set<String>(wordDict)
    var dp = Array(repeating: false, count: s.count + 1)
    dp[0] = true

    for i in 1..<s.count + 1 {
        for j in 0..<i where dp[j] && wordDict.contains(s[j..<i]) {
            dp[i] = true
        }
    }

    return dp[dp.count - 1]
}

private extension String {
    subscript(_ r: Range<Int>) -> String {
        let start = index(self.startIndex, offsetBy: r.lowerBound)
        let end = index(self.startIndex, offsetBy: r.upperBound)
        return String(self[start..<end])
    }
}
