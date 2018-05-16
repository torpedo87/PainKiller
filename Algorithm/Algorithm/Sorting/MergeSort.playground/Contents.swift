//: Playground - noun: a place where people can play

import UIKit

func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }    // 1
  
  let middleIndex = array.count / 2              // 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))             // 3
  
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // 4
  
  let result = merge(leftPile: leftArray, rightPile: rightArray)             // 5
  return result
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
  var leftIndex = 0
  var rightIndex = 0
  
  var orderedPile = [Int]()
  
  // 양쪽 원소를 비교해서 작은것 부터 채워넣기
  while leftIndex < leftPile.count && rightIndex < rightPile.count {
    if leftPile[leftIndex] < rightPile[rightIndex] {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
    } else if leftPile[leftIndex] > rightPile[rightIndex] {
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
      
    } else {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    }
  }
  
  //leftpile만 남았을 때
  while leftIndex < leftPile.count {
    orderedPile.append(leftPile[leftIndex])
    leftIndex += 1
    
  }
  
  //rightpile만 남았을 때
  while rightIndex < rightPile.count {
    orderedPile.append(rightPile[rightIndex])
    rightIndex += 1
  }
  
  return orderedPile
}


