//: Playground - noun: a place where people can play

import UIKit

var list: [Int] = [4, 2, 9, 6, 5, 8, 3, 1]

func quickSort(arr: [Int]) -> [Int] {
  if arr.count < 2 {
    return arr
  }
  
  let pivot = arr[0]
  var equalOrLess = [Int]()
  var more = [Int]()
  for i in 1..<arr.count {
    if arr[i] <= pivot {
      equalOrLess.append(arr[i])
    } else {
      more.append(arr[i])
    }
  }
  
  return quickSort(arr: equalOrLess) + [pivot] + quickSort(arr: more)
}

quickSort(arr: list)
