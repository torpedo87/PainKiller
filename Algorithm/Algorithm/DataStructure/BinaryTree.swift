//
//  BinaryTree.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 4..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

//binary tree는 children 이 최대 2개인 tree

enum BinaryTree<T> {
  //자식이 없는 경우
  case empty
  
  //자식이 있는 경우
  //recursive 인 경우 enum 이 값 타입인데 메모리를 알 수 없으므로 indirect 지정해줘야함
  indirect case node(BinaryTree, T, BinaryTree)
  
  //트리의 총 노드 갯수
  var count: Int {
    switch self {
    case let .node(left, _, right):
      return left.count + 1 + right.count
    case .empty:
      return 0
    }
  }
}


//구조를 설명해주는 helper
extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}








