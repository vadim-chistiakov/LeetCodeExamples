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
        let num = ""
        let n1 = ListNode(2, ListNode(0, ListNode(0, ListNode(1))))
        let n2 = ListNode(5, ListNode(6, ListNode(4, ListNode(9))))

        print(foo())
        
    }
    
    func foo() {
        print(1)
        DispatchQueue.main.async {
            print(2)
            DispatchQueue.global(qos: .background).async {
                print(3)
                DispatchQueue.global(qos: .background).sync {
                    print(4)
                }
                print(5)
            }
            print(6)
        }
        print(7)
    }
    
    // 1 7 2 6 3 4 5

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var num1 = ""
            var num2 = ""
            var l1 = l1
            var l2 = l2
            
            while l1 != nil {
                num1 += String(l1!.val)
                l1 = l1?.next
            }
            
            while l2 != nil {
                num2 += String(l2!.val)
                l2 = l2?.next
            }
            
        let result = Array(String((Int(String(num1.reversed())) ?? 0) + (Int(String(num2.reversed())) ?? 0)))
            
        var node = ListNode(Int(String(result.first!)) ?? 0)
            
            for index in 1..<result.count {
                let temp = ListNode(Int(String(result[index])) ?? 0)
                temp.next = node
                node = temp
            }
            
            return node
        }
}

