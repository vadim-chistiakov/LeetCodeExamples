//
//  BestTimeToBuyAndSellStockWithCooldown.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 31.10.2021.
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/

import Foundation

func bestTimeToBuyAndSellStockWithCooldown(_ prices: [Int]) -> Int {
    var buy = Int.min
    var sell = 0
    var rest = 0

    for price in prices {
        let lastSell = sell
        sell = max(buy + price, sell)
        buy = max(buy, rest - price)
        rest = lastSell
    }

    return max(sell, rest)
}
