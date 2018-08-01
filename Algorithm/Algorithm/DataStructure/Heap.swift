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
  
  //array 사용
  var elements: [T]
  let priorityFunction: (T, T) -> Bool
  
  init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
    self.elements = elements
    self.priorityFunction = priorityFunction
    buildHeap()
  }
  
  mutating func buildHeap() {
    //shifDown 은 자신과 children 간의 우선순위를 정렬해준다. 즉 children이 일단 제대로 정렬된 애들이어야 자신과 우선순위 비교가 가능
    //하위레벨부터 우선순위 정렬해나가기
    for index in (0 ..< count / 2).reversed() {
      siftDown(elementAtIndex: index)
    }
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
  
  public mutating func remove(at index: Int) -> T? {
    guard index < elements.count else { return nil }
    
    let size = elements.count - 1
    if index != size {
      elements.swapAt(index, size)
      
      //siftup, siftdown 둘다 해본다
      shiftDown(from: index, until: size)
      siftUp(elementAtIndex: index)
    }
    return elements.removeLast()
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
  
  //제일 밑에 마지막 자리에 넣은 후 parent 랑 비교해서 제자리 찾을때까지 거슬러 올라가기
  mutating func enqueue(_ element: T) {
    elements.append(element)
    siftUp(elementAtIndex: count - 1)
  }
  
  //parent랑 비교해서 제자리 찾을 때까지 swap 하면서 parent 타고 거슬러 올라가기
  mutating func siftUp(elementAtIndex index: Int) {
    let parent = parentIndex(of: index)
    
    //parent 보다 우선순위가 높은 경우에 swap
    guard !isRoot(index),
      isHigherPriority(at: index, than: parent)
      //root인 경우
      else { return }
    
    swapElement(at: index, with: parent)
    
    //재귀
    siftUp(elementAtIndex: parent)
  }
  
  
  
  
  
  //helper
  mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
    guard firstIndex != secondIndex
      else { return }
    
    //배열의 원소 swap
    elements.swapAt(firstIndex, secondIndex)
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
  
  //parent, leftchild, rightchild 중에 우선수위 제일 큰것
  func highestPriorityIndex(for parent: Int) -> Int {
    return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
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
  
  
}

extension Heap {
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(of: index)
    let rightChildIndex = leftChildIndex + 1
    
    
    var first = index
    if leftChildIndex < endIndex && priorityFunction(elements[leftChildIndex], elements[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && priorityFunction(elements[rightChildIndex], elements[first]) {
      first = rightChildIndex
    }
    if first == index { return }
    
    elements.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }

  public mutating func sort() -> [T] {
    
    // elements.count-1...1
    for i in stride(from: (elements.count - 1), through: 1, by: -1) {
      //root를 맨 마지막으로 빼고 나머지를 재졍렬해서 다시 최대값 찾기
      swapElement(at: 0, with: i)
      shiftDown(from: 0, until: i)
    }
    return elements
  }
}
