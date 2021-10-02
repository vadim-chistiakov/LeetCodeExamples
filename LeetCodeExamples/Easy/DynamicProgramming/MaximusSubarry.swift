//
//  MaximusSubarry.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 02.10.2021.
//

import Foundation
//Kadane's algorithm
func maxSubArray(_ nums: [Int]) -> Int {
        var m = 0
        var result = Int.min
        
        for i in 0..<nums.count {
            m = max(nums[i], m + nums[i])
            result = max(m, result)
        }
        return result
    }
