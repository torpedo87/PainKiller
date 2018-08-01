import UIKit

var str = "Hello, playground"

func factorialWithLoop(value: uint) -> uint {
  if value == 0 {
    return 1
  }
  
  var result: uint = 1
  for i in 1...value {
    result = result * i
  }
  return result
}


func factorialWithRecursion(value: uint) -> uint {
  if value == 0 {
    return 1
  }
  
  return value * factorialWithRecursion(value: value - 1)
}


factorialWithLoop(value: 10)
factorialWithRecursion(value: 10)
