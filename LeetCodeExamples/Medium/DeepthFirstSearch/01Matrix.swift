//
//  01Matrix.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 25.10.2021.
//  https://leetcode.com/problems/01-matrix/
//  Needs revise

import Foundation

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.count
        let cols = mat[0].count
        var dp = Array(repeating: Array(repeating: 10001, count: cols),
                      count: rows)
        
        for row in 0..<rows {
            for col in 0..<cols {
                if mat[row][col] == 0 {
                    dp[row][col] = 0
                    continue
                }
                if row > 0 {
                    dp[row][col] = dp[row-1][col] + 1
                }
                if col > 0 {
                    dp[row][col] = min(dp[row][col], dp[row][col-1] + 1)
                }
            }
        }
        
        for row in (0..<rows).reversed() {
            for col in (0..<cols).reversed() {
                if mat[row][col] == 0 {
                    continue
                }
                if col < cols - 1 {
                    dp[row][col] = min(dp[row][col], dp[row][col+1] + 1)
                }
                if row < rows - 1 {
                    dp[row][col] = min(dp[row][col], dp[row+1][col] + 1)
                }
            }
        }
        
        return dp
    }
