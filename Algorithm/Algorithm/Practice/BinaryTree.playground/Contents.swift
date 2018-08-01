import UIKit

var str = "Hello, playground"

class Node {
  var value: Int
  var leftChild: Node?
  var rightChild: Node?
  
  init(value: Int, left: Node?, right: Node?) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
  }
}

let twoNode = Node(value: 2, left: nil, right: nil)
let sixNode = Node(value: 6, left: nil, right: nil)
let fiveNode = Node(value: 5, left: twoNode, right: sixNode)
let seventeenNode = Node(value: 17, left: nil, right: nil)
let fifteenNode = Node(value: 15, left: nil, right: seventeenNode)
let rootNode = Node(value: 10, left: fiveNode, right: fifteenNode)

func search(node: Node?, searchValue: Int) -> Bool {
  if let node = node {
    if searchValue == node.value {
      return true
    } else if searchValue < node.value {
      return search(node: node.leftChild, searchValue: searchValue)
    } else {
      return search(node: node.rightChild, searchValue: searchValue)
    }
  }
  return false
}

search(node: rootNode, searchValue: 6)
