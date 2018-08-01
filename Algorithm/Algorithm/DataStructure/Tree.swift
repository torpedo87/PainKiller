//
//  Tree.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

//계층구조
//node(value, parent, child)

class Node<T> {
  var value: T
  var children: [Node] = []
  weak var parent: Node?
  
  init(value: T) {
    self.value = value
  }
  
  func addChild(child: Node) {
    self.children.append(child)
    child.parent = self
  }
}

extension Node where T: Equatable {
  
  func search(targetValue: T) -> Node? {
    if self.value == targetValue {
      return self
    }
    
    //재귀
    for child in children {
      if let found = child.search(targetValue: targetValue) {
        return found
      }
    }
    
    return nil
  }
}


