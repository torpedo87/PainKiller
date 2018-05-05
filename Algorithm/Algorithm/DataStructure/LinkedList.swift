//
//  LinkedList.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

//pointer
class NodeForLinkedList<T> {
  var value: T
  var next: NodeForLinkedList<T>?
  weak var previous: NodeForLinkedList<T>?
  
  init(value: T) {
    self.value = value
  }
}

//head, tail
class LinkedList<T> {
  fileprivate var head: NodeForLinkedList<T>?
  private var tail: NodeForLinkedList<T>?
  
  var isEmpty: Bool {
    return head == nil
  }
  
  var first: NodeForLinkedList<T>? {
    return head
  }
  
  var last: NodeForLinkedList<T>? {
    return tail
  }
  
  func append(newValue: T) {
    let newNode = NodeForLinkedList(value: newValue)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }
    
    tail = newNode
  }
  
  func nodeAt(index: Int) -> NodeForLinkedList<T>? {
    
    //head부터 시작해서 포인터를 따라서 찾아야함
    if index >= 0 {
      var node = head
      var i = index
      
      while node != nil {
        if i == 0 { return node }
        i -= 1
        node = node!.next
      }
    }
    
    return nil
  }
  
  func removeAll() {
    head = nil
    tail = nil
  }
  
  func remove(node: NodeForLinkedList<T>) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      //head를 삭제하는 경우
      head = next
    }
    next?.previous = prev
    
    //tail을 삭제하는 경우
    if next == nil {
      tail = prev
    }
    
    node.previous = nil
    node.next = nil
    
    return node.value
  }
}
