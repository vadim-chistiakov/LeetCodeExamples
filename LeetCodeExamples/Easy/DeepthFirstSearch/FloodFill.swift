//
//  FloodFill.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 21.10.2021.
//  https://leetcode.com/problems/flood-fill/

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
       var vImage = image
       let color = vImage[sr][sc]
       if color != newColor {
           dfs(&vImage, sr, sc, newColor, color)
       }
       return vImage
       
   }
   
   private func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ newColor: Int, _ color: Int) {
       if image[r][c] == color {
           image[r][c] = newColor
           if r >= 1 { dfs(&image, r-1, c, newColor, color) }
           if c >= 1 { dfs(&image, r, c-1, newColor, color) }
           if r+1 < image.count { dfs(&image, r+1, c, newColor, color) }
           if c+1 < image[0].count { dfs(&image, r, c+1, newColor, color)}
       }
   }
