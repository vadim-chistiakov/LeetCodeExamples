//
//  DeleteAndEarn.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 24.10.2021.
//  https://leetcode.com/problems/delete-and-earn/
//  Don't understand

import Foundation
func deleteAndEarn(_ nums: [Int]) -> Int {
        var sum = Array(repeating: 0, count: 10001)
        for num in nums {
            sum[num] += num
        }
        
        var dp = Array(repeating: 0, count: 10001)
        dp[1] = sum[1]
        
        for i in 2..<10001 {
            dp[i] = max(dp[i - 1], dp[i - 2] + sum[i]);
        }
        
        return dp[10000];
    }
