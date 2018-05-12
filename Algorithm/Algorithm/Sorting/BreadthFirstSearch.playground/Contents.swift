//: Playground - noun: a place where people can play

import UIKit

//hash table 사용해서 graph 만들기
//key 값은 노드, value는 해당 노드의 이웃들
var graph = [String : [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

//queue - first in, first out
public struct CustomQueue<T> {
  private var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public func peekFront() -> T? {
    return array.first
  }
  
  public func peekBack() -> T? {
    return array.last
  }
}

//예제에서 mango seller 찾는 함수
func persionIsSeller(name: String) -> Bool {
  return name.characters.last == "m"
}


//둘 사이 연결하는 경로가 있는지, 최단 경로는 무엇인지 파악할 때 사용
func breadthFirstSearch(name: String) -> Bool {
  var searchQueue = CustomQueue<String>()
  
  //이웃을 큐에 넣는다
  for string in graph[name]! {
    searchQueue.enqueue(string)
  }
  
  //이미 확인한 것은 체크해놓기
  var searched = [String]()
  
  
  while !searchQueue.isEmpty {
    let person = searchQueue.dequeue()
    
    //큐 앞에서부터 이웃을 확인한다. 기존에 확인했던 사람이 아닌경우 mango seller가 맞는지 확인해서 아니라면 그 사람의 이웃을 큐 맨 뒤에 넣기
    if !searched.contains(person!) {
      if persionIsSeller(name: person!) {
        //가장 가까운 망고상인 출력
        print("\(person!) is a mango seller!")
        return true
      } else {
        for string in graph[person!]! {
          searchQueue.enqueue(string)
        }
        searched.append(person!)
      }
    }
  }
  
  //망고상인이 이웃중에 아무도 없는 경우
  return false
}

breadthFirstSearch(name: "you")
