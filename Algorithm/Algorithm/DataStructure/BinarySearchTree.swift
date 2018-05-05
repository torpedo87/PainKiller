//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation
//binary search tree = leftchild < T < rightchild

enum BinarySearchTree<T: Comparable> {
  //자식이 없는 경우
  case empty
  
  //자식이 있는 경우
  //recursive 인 경우 enum 이 값 타입인데 메모리를 알 수 없으므로 indirect 지정해줘야함
  indirect case node(BinarySearchTree, T, BinarySearchTree)
  
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
  private func newTreeWithInsertedValue(newValue: T) -> BinarySearchTree {
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
  func search(searchValue: T) -> BinarySearchTree? {
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

