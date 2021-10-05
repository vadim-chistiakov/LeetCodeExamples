//
//  FindDublicates.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 05.10.2021.
//

import Foundation

func findDublicates(_ array: [Int]) -> Int {
    var hare = array[0]
    var tourtle = array[0]
    
    while true {
        tourtle = array[tourtle]
        hare = array[array[hare]]
        if tourtle == hare {
            break
        }
    }
    
    var ptr1 = array[0]
    var ptr2 = tourtle
    
    while ptr1 != ptr2 {
        ptr1 = array[ptr1]
        ptr2 = array[ptr2]
    }
    return ptr1
}
