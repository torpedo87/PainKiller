//
//  Stack.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation


struct Stack<T> {
  
  var list = LinkedList<T>()
  
  var isEmpty: Bool {
    return list.isEmpty
  }
  
  //맨 뒤에 넣기
  mutating func push(_ element: T) {
    list.append(newValue: element)
  }
  
  //맨 뒤에서 빼내기
  mutating func pop() -> T? {
    guard !list.isEmpty, let element = list.last else { return nil }
    
    list.remove(node: element)
    return element.value
  }
  
}
