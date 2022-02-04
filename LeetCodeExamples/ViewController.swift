//
//  ViewController.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 01.10.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [1,0,x,y,0,1] -> 2
        // [1,0,0,0,0,0,0] -> 6
        // 1минимум - свободное
        // 1мин - занятое
        // 1 [0,1,0]
        // [1,1,1,1,1,0] -> 1

        // [1,0,0,0,0,1,0,0,0] -> 3
        // [0,0,0,1,0,0,0,0,1] -> 3
        
        print(findEmptySeat([1,0,0,0,0,1]))
        print(findEmptySeat([1,0,0,0,0,0,0]))
        print(findEmptySeat([0,1,0]))
        print(findEmptySeat([1,1,1,1,1,0]))
        print(findEmptySeat([1,0,0,0,0,1,0,0,0]))
        print(findEmptySeat([0,0,0,1,0,0,0,0,1]))

        
    }
}

