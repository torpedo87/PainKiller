//: Playground - noun: a place where people can play

import UIKit

var arr = [1, 3, 8, 4, 2, 7, 13, 6]

//func getMinIndex(target: [Int]) -> Int {
//
//  var minIndex = 0
//  var min = target[minIndex]
//  for i in 0..<target.count {
//    if target[i] < min {
//      minIndex = i
//      min = target[minIndex]
//    }
//  }
//  return minIndex
//}
//
//func selectionSort(target: [Int]) -> [Int] {
//  var tempArr = target
//  var resultArr = [Int]()
//  for _ in 0..<target.count {
//    let minIndex = getMinIndex(target: tempArr)
//    resultArr.append(tempArr.remove(at: minIndex))
//  }
//  return resultArr
//}
//
//selectionSort(target: arr)


class LinkedList<T> {
  class LinkedListNode {
    var value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
      self.value = value
    }
  }
  
  typealias Node = LinkedListNode
  
  private(set) var head: Node?
  
  var last: Node? {
    guard var node = head else {
      return nil
    }
    while let next = node.next {
      node = next
    }
    return node
  }
  
  func node(at index: Int) -> Node? {
    // 여기다 하시오
    var node = head
    var i = index
    assert(index >= 0)
    
    while node != nil {
      if i == 0 {
        return node
      }
      node = node!.next
      i -= 1
    }
    
    return nil
  }
  
//  func append(_ value: T) {
//    let newNode = Node(value: value)
//    append(newNode)
//  }
//
//  func append(_ node: Node) {
//    if let lastNode = last {
//      lastNode.next = node
//      node.previous = lastNode
//    } else {
//      head = node
//    }
//  }
  
  public func append(value: T) {
    let newNode = Node(value: value)
    if let lastNode = last {
      newNode.previous = lastNode
      lastNode.next = newNode
    } else {
      head = newNode
    }
  }
  
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    var s = "["
    var node = head
    while node != nil {
      s += "\(node!.value)"
      node = node!.next
      if node != nil { s += ", " }
    }
    return s + "]"
  }
}

var list = LinkedList<Int>()
for index in 0...10 {
  list.append(value: index)
}


list.description
