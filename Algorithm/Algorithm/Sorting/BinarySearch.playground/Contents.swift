//: Playground - noun: a place where people can play

import UIKit

var list = [1, 3, 5, 7, 9, 10, 15]

//loop
func binarySearch(list: [Int], target: Int) -> Int? {
  var startIndex = 0
  var endIndex = list.count - 1
  var midIndex: Int = (endIndex + startIndex) / 2
  var midValue = list[midIndex]

  while startIndex <= endIndex {
    if midValue > target {
      endIndex = midIndex - 1
      midIndex = (endIndex + startIndex) / 2
      midValue = list[midIndex]
    } else if midValue < target {
      startIndex = midIndex + 1
      midIndex = (endIndex + startIndex) / 2
      midValue = list[midIndex]
    } else {
      return midIndex
    }
  }
  return nil
}

binarySearch(list: list, target: 4)


//recursion
func binary(list: [Int], startIndex: Int, endIndex: Int, target: Int) -> Int? {
  let midIndex: Int = (endIndex + startIndex) / 2
  let midValue = list[midIndex]
  if startIndex <= endIndex {
    if midValue == target {
      return midIndex
    } else if midValue > target {
      return binary(list: list, startIndex: startIndex, endIndex: midIndex - 1, target: target)
    } else {
      return binary(list: list, startIndex: midIndex + 1, endIndex: endIndex, target: target)
    }
  }
  return nil
}

binary(list: list, startIndex: 0, endIndex: list.count - 1, target: 5)
