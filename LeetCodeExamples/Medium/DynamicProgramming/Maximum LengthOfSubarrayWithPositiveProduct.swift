//
//  Maximum LengthOfSubarrayWithPositiveProduct.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 26.10.2021.
//  https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/

import Foundation

func getMaxLen(_ nums: [Int]) -> Int {
    var positive = 0
    var negative = 0
    var result = 0
    
    for num in nums {
        if num == 0 {
            positive = 0
            negative = 0
        } else if num > 0 {
            positive += 1
            negative = negative == 0 ? 0 : negative+1
        } else {
            let temp = positive
            positive = negative == 0 ? 0 : negative+1
            negative = temp+1
        }
        result = max(result, positive)
    }
    return result
}
