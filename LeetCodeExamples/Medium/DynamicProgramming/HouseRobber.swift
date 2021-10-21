//
//  HouseRobber.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 05.10.2021.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    var dp = [Int]()
    dp.append(0)
    dp.append(nums[0])
    
    for index in 1..<nums.count {
        dp.append(max(dp[index-1] + nums[index], dp[index]))
    }
    return dp[nums.count]
}
