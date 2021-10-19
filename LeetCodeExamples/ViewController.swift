//
//  ViewController.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 01.10.2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let st = "sdfsdfdfg"
        let arr = Array(st)

        let dict: [Character: Int] = arr.reduce([:]) { result, char in
            var result = result
            result[char, default: 0] += 1
            return result
        }
    }
}

