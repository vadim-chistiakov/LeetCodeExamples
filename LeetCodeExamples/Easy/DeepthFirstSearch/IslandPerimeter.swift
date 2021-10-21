//
//  IslandPerimeter.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 21.10.2021.
//

import Foundation

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var result = 0
    for r in 0..<grid.count {
        for s in 0..<grid[0].count {
            result += dfs(grid, r, s)
        }
    }
    return result
}
    
private func dfs(_ grid: [[Int]], _ r: Int, _ s: Int) -> Int {
    var result = 0
    
    if grid[r][s] == 0 {
        print(result)
        return 0
    }
    if (r-1 >= 0 && grid[r-1][s] == 0) || r-1 < 0 {
        result += 1
    }
    if (s-1 >= 0 && grid[r][s-1] == 0) || s-1 < 0 {
        result += 1
    }
    if (r+1 < grid.count && grid[r+1][s] == 0) ||  r+1 > (grid.count-1) {
        result += 1
    }
    if (s+1 < grid[0].count && grid[r][s+1] == 0) || s+1 > (grid[0].count-1)  {
        result += 1
    }
    print(result)
    return result
}
