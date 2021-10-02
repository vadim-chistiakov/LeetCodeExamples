//
//  BestTimeToBuyAndSellStock.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 02.10.2021.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = prices[0]
    var profit = 0
    
    for i in 1..<prices.count {
        if (prices[i] - minPrice) > profit {
            profit = prices[i] - minPrice
        }
        if prices[i] < minPrice {
            minPrice = prices[i]
        }
    }
    return profit
}
