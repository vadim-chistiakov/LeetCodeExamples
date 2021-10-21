//
//  MaxAreaOfIsland.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 21.10.2021.
//

import Foundation
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var grid = grid
    var result = 0
    
    for r in 0..<grid.count {
        for s in 0..<grid[0].count {
            result = max(result, dfs(&grid, r, s))
            print(result)
        }
    }
    return result
}
    
private func dfs(_ grid: inout [[Int]], _ r: Int, _ s: Int) -> Int {
    if r < 0 || s < 0 || (r > grid.count-1) || (s > grid[0].count-1) || grid[r][s] != 1 {
        return 0
    }
    grid[r][s] = 2
    return 1 + dfs(&grid, r-1, s) + dfs(&grid, r+1, s) + dfs(&grid, r, s-1) + dfs(&grid, r, s+1)
}
