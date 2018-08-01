//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation


enum BST<T: Comparable> {
  //자식이 없는 경우
  case empty

  //자식이 있는 경우
  //recursive 인 경우 enum 이 값 타입인데 메모리를 알 수 없으므로 indirect 지정해줘야함
  indirect case node(BST, T, BST)

  //트리의 총 노드 갯수
  var count: Int {
    switch self {
    case let .node(left, _, right):
      return left.count + 1 + right.count
    case .empty:
      return 0
    }
  }

  //적절한 자리를 찾아 새로운 값을 삽입한다
  private func newTreeWithInsertedValue(newValue: T) -> BST {
    switch self {
    case .empty:
      return .node(.empty, newValue, .empty)
    case let .node(left, value, right):
      if newValue < value {
        //재귀
        return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
      } else {
        return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
      }
    }
  }

  //insert할때마다 값을 복사해야하므로 비효율적 (차라리 class 사용하는 것이 더 빠르다)
  mutating func insert(newValue: T) {
    self = newTreeWithInsertedValue(newValue: newValue)
  }


  //제일왼쪽아래부터 휘젓고 다니면서 모든 노드를 탐색하면서 어떤 process 를 수행
  //left - me - right
  func traverseInOrder(process: (T) -> ()) {
    switch self {
    case .empty:
      return

    case let .node(left, value, right):
      left.traverseInOrder(process: process)
      process(value)
      right.traverseInOrder(process: process)
    }
  }

  //me - left - right
  func traversePreOrder( process: (T) -> ()) {
    switch self {
    case .empty:
      return

    case let .node(left, value, right):
      process(value)
      left.traversePreOrder(process: process)
      right.traversePreOrder(process: process)
    }
  }

  //left - right - me
  func traversePostOrder( process: (T) -> ()) {
    switch self {
    case .empty:
      return
    case let .node(left, value, right):
      left.traversePostOrder(process: process)
      right.traversePostOrder(process: process)
      process(value)
    }
  }

  //traverse는 left, right 다 살펴보지만
  //search는 left or right 한쪽을 결정
  func search(searchValue: T) -> BST? {
    switch self {
    case .empty:
      return nil

    case let .node(left, value, right):

      if searchValue == value {
        return self
      }

      //재귀
      if searchValue < value {
        return left.search(searchValue: searchValue)
      } else {
        return right.search(searchValue: searchValue)
      }
    }
  }

}


//binary search tree = leftchild < T < rightchild
//tree(value, parent, left, right)
public class BinarySearchTree<T: Comparable> {
  private(set) public var value: T
  private(set) public var parent: BinarySearchTree?
  private(set) public var left: BinarySearchTree?
  private(set) public var right: BinarySearchTree?
  
  public init(value: T) {
    self.value = value
  }
  
  public var isRoot: Bool {
    return parent == nil
  }
  
  public var isLeftChild: Bool {
    return parent?.left === self
  }
  
  public var isRightChild: Bool {
    return parent?.right === self
  }
  
  //자식들과 자기자신 포함
  public var count: Int {
    return (left?.count ?? 0) + 1 + (right?.count ?? 0)
  }
  
  //재귀
  public func insert(value: T) {
    if value < self.value {
      if let left = left {
        left.insert(value: value)
      } else {
        left = BinarySearchTree(value: value)
        left?.parent = self
      }
    } else {
      if let right = right {
        right.insert(value: value)
      } else {
        right = BinarySearchTree(value: value)
        right?.parent = self
      }
    }
  }
  
  public convenience init(array: [T]) {
    //assert랑 비슷한듯
    precondition(array.count > 0)
    //첫번째 원소 넣어놓고 (root)
    self.init(value: array.first!)
    //두번째부터 삽입
    for v in array.dropFirst() {
      insert(value: v)
    }
  }
  
  public func search(_ value: T) -> BinarySearchTree? {
    var node: BinarySearchTree? = self
    
    while let n = node {
      if value < n.value {
        node = n.left
      } else if value > n.value {
        node = n.right
      } else {
        //value 찾으면 return
        return node
      }
    }
    return nil
  }
  
  
  public func traverseInOrder(process: (T) -> Void) {
    left?.traverseInOrder(process: process)
    process(value)
    right?.traverseInOrder(process: process)
  }
  
  public func traversePreOrder(process: (T) -> Void) {
    process(value)
    left?.traversePreOrder(process: process)
    right?.traversePreOrder(process: process)
  }
  
  public func traversePostOrder(process: (T) -> Void) {
    left?.traversePostOrder(process: process)
    right?.traversePostOrder(process: process)
    process(value)
  }
  
  
  private func reconnectParentTo(node: BinarySearchTree?) {
    if let parent = parent {
      if isLeftChild {
        parent.left = node
      } else {
        parent.right = node
      }
    }
    node?.parent = parent
  }
}


extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])

