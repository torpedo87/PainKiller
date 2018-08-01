//: Playground - noun: a place where people can play

import UIKit

var swapCount = 0

//합칠때 비교해서 sorting

func mergeSort(_ array: [Int]) -> [Int] {
  
  //탈출조건
  guard array.count > 1 else { return array }
  
  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
  let result = merge(leftPile: leftArray, rightPile: rightArray)
  return result
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
  
  var leftIndex = 0
  var rightIndex = 0
  
  var orderedPile = [Int]()
  
  // 양쪽 원소를 비교해서 작은것 부터 채워넣기
  while leftIndex < leftPile.count && rightIndex < rightPile.count {
    if leftPile[leftIndex] <= rightPile[rightIndex] {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
    } else {
      orderedPile.append(rightPile[rightIndex])
      swapCount += leftPile.count - leftIndex
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
  print(leftPile, rightPile, swapCount)
  return orderedPile
}

let a = [2, 1, 3, 1, 2]
mergeSort(a)
swapCount
