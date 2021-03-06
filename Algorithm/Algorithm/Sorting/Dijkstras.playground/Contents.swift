//: Playground - noun: a place where people can play

import UIKit

//그래프에 이웃과 각 거리 저장
typealias Nodes = [String:Double]
var graph =  [String : Nodes] ()
graph["start"] = Nodes()
graph["start"]?["a"] = 6
graph["start"]?["b"] = 2
graph["a"] = Nodes()
graph["a"]?["fin"] = 1
graph["b"] = Nodes()
graph["b"]?["a"] = 3
graph["b"]?["fin"] = 5
graph["fin"] = Nodes()

//시작점 부터 해당 노드까지의 누적 거리
let infinity = Double.infinity
var costTable = Nodes()
costTable["a"] = 6
costTable["b"] = 2
costTable["fin"] = infinity

//parents table
var parentTable = [String: String]()
parentTable["a"] = "start"
parentTable["b"] = "start"
parentTable["fin"] = nil

//log
var processed = [String]()

//현재 노드에서 가장 짧은 거리의 이웃노드 찾기
func findLowestCostNodes(costTable: Nodes) -> Nodes {
  var lowestCost = Double.infinity
  var lowestCostNodes = Nodes()
  
  for node in costTable {
    let cost = node.value
    if (cost < lowestCost) && !processed.contains(node.key) {
      lowestCost = cost
      lowestCostNodes = [node.key : node.value]
    }
  }
  return lowestCostNodes
}

var lowestCostNodes = findLowestCostNodes(costTable: costTable)

//이웃이 없을때까지 반복. 즉 목적지에 다다를때까지 반복
while !lowestCostNodes.isEmpty {
  
  //현재 노드의 key
  var nodeKey = lowestCostNodes.first?.key
  //현재 노드까지의 누적거리
  var cost = costTable[nodeKey!]
  
  //이웃노드들
  var neighborNodes = graph[nodeKey!]
  
  //이웃노드들 돌면서 최단거리 업데이트
  for n in (neighborNodes?.keys)! {
    var newCost = cost! + (neighborNodes?[n])!
    if costTable[n]! > newCost {
      costTable[n] = newCost
      parentTable[n] = nodeKey
    }
  }
  
  //이 노드 체크했다고 표시
  processed.append(nodeKey!)
  //다음 단계의 가장 가까운 노드로 이동
  lowestCostNodes = findLowestCostNodes(costTable: costTable)
}

print(costTable)
