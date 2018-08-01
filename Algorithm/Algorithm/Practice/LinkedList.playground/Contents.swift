import UIKit

var str = "Hello, playground"

class Node {
  var value: Int
  var next: Node?
  
  init(value: Int, next: Node?) {
    self.value = value
    self.next = next
  }
}

//1 -> 2 -> 3 -> nil

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let head = Node(value: 1, next: twoNode)

func printList(head: Node?) {
  var currentNode = head
  
  while currentNode != nil {
    print(currentNode?.value)
    currentNode = currentNode?.next
  }
}

printList(head: head)





// 1 -> 2 -> 3 -> nil
// nil <- 1 -> 2 -> 3 -> nil
// nil <- 1 <- 2 -> 3 -> nil
// nil <- 1 <- 2 <- 3 -> nil
// nil <- 1 <- 2 <- 3

func reverseLinkedList(head: Node?) -> Node? {
  var currentNode = head
  var next: Node?
  var prev: Node?
  
  while currentNode != nil {
    next = currentNode?.next
    currentNode?.next = prev
    prev = currentNode
    currentNode = next
  }
  
  return prev
}

let reverseList = reverseLinkedList(head: head)
printList(head: reverseList)
