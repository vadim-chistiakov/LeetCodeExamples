//
//  EstimatePi.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 05.10.2021.
//

import Foundation

func estimatePi(_ n: Int) -> Double {
    var pointsInTotal: Double = 0
    var pointsInCyrcle: Double = 0
    
    for _ in 0...n {
        let x = Double.random(in: 0...1)
        let y = Double.random(in: 0...1)
        
        let distance = x*x + y*y
        
        if distance <= 1 {
            pointsInCyrcle += 1
        }
        pointsInTotal += 1
    }
    
    return 4 * pointsInCyrcle / pointsInTotal
}
