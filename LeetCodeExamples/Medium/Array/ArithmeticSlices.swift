//
//  ArithmeticSlices.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 01.11.2021.
//  https://leetcode.com/problems/arithmetic-slices/

import Foundation

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    if nums.count < 3 { return 0 }
    var res = 0, count = 0
    for i in 2..<nums.count {
        if nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2] {
            count += 1
            res += count
        } else {
            count = 0
        }
    }
    return res
}

func numberOfArithmeticSlicesSlow(_ nums: [Int]) -> Int {
    guard nums.count > 2 else { return 0 }
    var current = 0
    for i in 0..<nums.count {
        for j in i..<nums.count {
            if checkIfArray(Array(nums[i...j])) {
                current += 1
            }
        }
    }
    return current
}

private func checkIfArray(_ nums: [Int]) -> Bool {
    guard nums.count > 3 else { return false }
    var diff = nums[0] - nums[1]
    for i in 2..<nums.count where nums[i-1] - nums[i] != diff {
        return false
    }
    return true
}
