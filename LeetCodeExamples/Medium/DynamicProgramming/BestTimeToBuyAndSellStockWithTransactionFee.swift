//
//  BestTimeToBuyAndSellStockWithTransactionFee.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 31.10.2021.
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/

import Foundation
func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    var hold = -prices[0]
    var cash = 0
    
    for i in 1..<prices.count {
        cash = max(cash, hold + prices[i] - fee)
        hold = max(hold, cash - prices[i])
    }
    return cash
}
