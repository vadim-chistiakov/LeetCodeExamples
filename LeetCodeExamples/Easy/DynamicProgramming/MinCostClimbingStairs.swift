//
//  MinCostClimbingStairs.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 21.10.2021.
//  https://leetcode.com/problems/min-cost-climbing-stairs/

import Foundation
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = [Int]()
    dp.append(0)
    dp.append(cost[0])
    
    for i in 1..<cost.count {
        dp.append(cost[i] + min(dp[i], dp[i-1]))
    }
    return min(dp[dp.count-1], dp[dp.count-2])
}
