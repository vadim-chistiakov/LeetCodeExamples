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

// https://leetcode.com/problems/house-robber-ii/
func rob2(_ nums: [Int]) -> Int {
    guard nums.count != 1 else { return nums[0] }
    var nums1 = nums
    nums1.removeFirst()
    
    var nums2 = nums
    nums2.removeLast()
    
    var dp1 = [Int]()
    var dp2 = [Int]()
    
    dp1.append(0)
    dp1.append(nums1[0])
    
    dp2.append(0)
    dp2.append(nums2[0])
    
    for index in 1..<nums.count-1 {
        dp1.append(max(nums1[index] + dp1[index-1], dp1[index]))
        dp2.append(max(nums2[index] + dp2[index-1], dp2[index]))
    }
    
    return max(dp1[dp1.count-1], dp2[dp2.count-1])
    
}
