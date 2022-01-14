//
//  RemoveLinkedListElements.swift
//  LeetCodeExamples
//
//  Created by Vadim Chistiakov on 14.10.2021.
//  https://leetcode.com/problems/remove-linked-list-elements/

import Foundation

class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    var description: String {
        var result = "\(val)"
        while next != nil {
            result += "\(next?.val ?? 0)"
            next = next?.next
        }
        return result
    }
 }

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var counter = head
    
    while counter != nil {
        if counter?.next != nil && counter!.next!.val == val {
            counter?.next = counter!.next!.next
        } else {
            counter = counter!.next
        }
    }
    if head != nil && head!.val == val {
        return head?.next
    }
    return head
}
