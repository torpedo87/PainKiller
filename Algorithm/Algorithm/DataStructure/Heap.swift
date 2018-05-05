//
//  Heap.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

// parent 우선순위 > children 우선순위
// root는 우선순위가 가장 높음
//가장 큰 수 root를 알수 있으므로 root를 제거하면서 그다음 최대값인 root를 알아내어 sort 가능

struct Heap<T> {
  var elements: [T]
  let priorityFunction: (T, T) -> Bool
  
  init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
    self.elements = elements
    self.priorityFunction = priorityFunction
    buildHeap()
  }
  
  mutating func buildHeap() {
    for index in (0 ..< count / 2).reversed() {
      siftDown(elementAtIndex: index)
    }
  }
  
  var isEmpty: Bool {
    return elements.isEmpty
  }
  
  var count: Int {
    return elements.count
  }
  
  //가장 높은 우선순위의 값, root 값
  func peek() -> T? {
    return elements.first
  }
  
  //제일 밑에 마지막 자리에 넣은 후 parent 랑 비교해서 제자리 찾을때까지 거슬러 올라가기
  mutating func enqueue(_ element: T) {
    elements.append(element)
    siftUp(elementAtIndex: count - 1)
  }
  
  //parent랑 비교해서 제자리 찾을 때까지 swap 하면서 parent 타고 거슬러 올라가기
  mutating func siftUp(elementAtIndex index: Int) {
    let parent = parentIndex(of: index)
    
    //parent 보다 우선순위가 높은 경우
    guard !isRoot(index),
      isHigherPriority(at: index, than: parent)
      //root인 경우
      else { return }
    
    swapElement(at: index, with: parent)
    
    //재귀
    siftUp(elementAtIndex: parent)
  }
  
  
  //가장 높은 우선순위값 즉 root노드 삭제하고 여기에 제일 우선순위 낮은 애를 데려와서 child 비교하면서 제자리 찾을 때까지 타고 내려가기
  mutating func dequeue() -> T? {
    guard !isEmpty
      else { return nil }
    
    //제일 우선순위 작은 애를 root와 자리 교체
    swapElement(at: 0, with: count - 1)
    
    //root 삭제
    let element = elements.removeLast()
    
    //root 자리로 데려온 노드를 child와 비교하면서 타고 내려가기
    if !isEmpty {
      siftDown(elementAtIndex: 0)
    }
    return element
  }
  
  //child랑 비교하면서 제자리 찾을 때까지 swap 하면서 타고내려가기
  mutating func siftDown(elementAtIndex index: Int) {
    
    //left, right 중에 우선순위가 큰 child와 비교
    let childIndex = highestPriorityIndex(for: index)
    if index == childIndex {
      return
    }
    swapElement(at: index, with: childIndex)
    
    //재귀
    siftDown(elementAtIndex: childIndex)
  }
  
  
  //helper
  func isRoot(_ index: Int) -> Bool {
    return (index == 0)
  }
  
  func leftChildIndex(of index: Int) -> Int {
    return (2 * index) + 1
  }
  
  func rightChildIndex(of index: Int) -> Int {
    return (2 * index) + 2
  }
  
  func parentIndex(of index: Int) -> Int {
    return (index - 1) / 2
  }
  
  
  //우선순위 비교
  func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
    return priorityFunction(elements[firstIndex], elements[secondIndex])
  }
  
  func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
    guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
      else { return parentIndex }
    return childIndex
  }

  func highestPriorityIndex(for parent: Int) -> Int {
    return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
  }
  
  mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
    guard firstIndex != secondIndex
      else { return }
    elements.swapAt(firstIndex, secondIndex)
  }
}
