//: Playground - noun: a place where people can play

import UIKit

var list: [Int] = [4, 2, 9, 6, 5, 8, 3, 1, 2]

//피봇 기준으로 나눌 때 sorting

func quickSort(arr: [Int]) -> [Int] {
  
  //탈출조건
  if arr.count < 2 {
    return arr
  }
  
  //임의로 피봇 정하기
  let pivot = arr[0]
  
  //smaller group
  var equalOrLess = [Int]()
  
  //bigger group
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
