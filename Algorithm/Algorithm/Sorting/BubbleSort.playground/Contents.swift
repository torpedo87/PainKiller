//: Playground - noun: a place where people can play

import UIKit

func bubbleSort(arr: [Int]) -> [Int] {
  var temp = arr
  for _ in 0..<arr.count {
    for j in 0..<arr.count - 1 {
      if temp[j] > temp[j+1] {
        temp.swapAt(j, j+1)
      }
    }
  }
  return temp
}

