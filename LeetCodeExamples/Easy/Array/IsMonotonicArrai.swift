//
//  IsMonotonicArrai.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 19.10.2021.
//  Не решил на собесе в Яндекс в 2017)

import Foundation

func isMonotonic(_ nums: [Int]) -> Bool {
    var isIncrease = true
    var isDecrease = true
    
    for index in 1..<nums.count {
        if nums[index] > nums[index - 1] {
            isDecrease = false
        } else if nums[index] < nums[index - 1] {
            isIncrease = false
        }
    }
    
    return isIncrease || isDecrease
}
