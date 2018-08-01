//
//  LinkedList.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

//value, nextNode, prevNode
class NodeForLinkedList<T> {
  var value: T
  var next: NodeForLinkedList<T>?
  
  //next 아니고 무조건 prev 에 weak 해줘야 잘 동작하네
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
    
    //꼬리에 삽입
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }
    
    tail = newNode
  }
  
  //read
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
  
  //delete (head, 중간, tail일 경우)
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
