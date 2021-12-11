//
//  SpiralMatrix.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 11.12.2021.
//  https://leetcode.com/problems/spiral-matrix-ii/

import Foundation

func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array(repeating:Array(repeating: 0, count: n), count: n)
    var cnt = 1
    let dir = [[0,1],[1,0],[0,-1],[-1,0]]
    var d = 0
    var row = 0
    var col = 0
    
    while cnt <= n*n {
        matrix[row][col] = cnt
        cnt += 1
        let r = floorMod(row+dir[d][0], n)
        let c = floorMod(col+dir[d][1], n)
        if (matrix[r][c] != 0) {
            d = (d+1) % 4
        }
        row += dir[d][0]
        col += dir[d][1]
    }
    return matrix
}

private func floorMod(_ x: Int, _ y: Int) -> Int {
    ((x % y) + y) % y
}
