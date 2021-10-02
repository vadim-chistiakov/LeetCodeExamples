//
//  LongestCommonSubsequence.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 02.10.2021.
//

import Foundation

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: text2.count+1), count: text1.count+1)
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        
        for i in 1...arr1.count {
            for j in 1...arr2.count {
                if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[text1.count][text2.count]
    }
