import UIKit

let sortedArr = [1, 3, 5, 7, 9, 11, 13, 15]


func binarySearch(searchValue: Int, arr: [Int]) -> Bool {
  
  var startIndex: Int = 0
  var endIndex: Int = arr.count - 1
  
  while startIndex <= endIndex {
    let midIndex = (startIndex + endIndex) / 2
    let midValue = arr[midIndex]
    if searchValue < midValue {
      endIndex = midIndex - 1
    } else if searchValue > midValue {
      startIndex = midIndex + 1
    } else {
      print(arr[midIndex])
      return true
    }
  }
  
  return false
}

binarySearch(searchValue: 4, arr: sortedArr)
binarySearch(searchValue: 11, arr: sortedArr)
