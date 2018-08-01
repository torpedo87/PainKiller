//
//  Practice.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 24..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

struct Heeap {
  var elements: [Int]
  
  mutating func swapElement(atIndex: Int, withIndex: Int) {
    elements.swapAt(atIndex, withIndex)
  }
  
  mutating func enqueue(newElement: Int) {
    elements.append(newElement)
    
    siftUp(index: elements.count - 1)
  }
  
  mutating func siftUp(index: Int) {
    let parent = getParentIndex(i: index)
    guard isHigher(childIndex: index, than: parent) else { return }
    swapElement(atIndex: parent, withIndex: index)
    siftUp(index: parent)
  }
  
  func isHigher(childIndex: Int, than: Int) -> Bool {
    return elements[childIndex] > elements[than]
  }
  
  func getParentIndex(i: Int) -> Int {
    return (i - 1) / 2
  }
  
  func getLeftChildIndex(i: Int) -> Int {
    return 2 * i + 1
  }
  
  func getRightChildIndex(i: Int) -> Int {
    return 2 * i + 2
  }
}


