import UIKit

var str = "Hello, playground"

func fiboWithLoop(step: Int) -> [Int] {
  
  var sequence = [0, 1]
  if step <= 1 {
    return sequence
  }
  
  for _ in 0..<step - 2 {
    let first = sequence[sequence.count - 2]
    let second = sequence.last!
    sequence.append(first + second)
  }
  
  return sequence
}


fiboWithLoop(step: 6)

func fiboWithRecursion(step: Int, first: Int, second: Int) -> [Int] {
  
  if step == 0 {
    return []
  }
  let newValue = first + second
  return [newValue] + fiboWithRecursion(step: step - 1, first: second, second: newValue)
}


[0, 1] + fiboWithRecursion(step: 3, first: 0, second: 1)
