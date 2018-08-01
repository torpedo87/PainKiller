//
//  Queue.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

struct Queue<T> {
  
  var list = LinkedList<T>()
  
  var isEmpty: Bool {
    return list.isEmpty
  }
  
  //맨 뒤에 넣기
  mutating func enqueue(_ element: T) {
    list.append(newValue: element)
  }
  
  //맨 앞에서 빼내기
  mutating func dequeue() -> T? {
    guard !list.isEmpty, let element = list.first else { return nil }
    
    list.remove(node: element)
    return element.value
  }
  
  func peek() -> T? {
    return list.first?.value
  }
  
}

