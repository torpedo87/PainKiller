//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var numbers = [Int]()
for i in 1...20 {
  numbers.append(i)
}

for number in numbers {
  if number % 15 == 0 {
    print("FizzBuzz")
  } else if number % 3 == 0 {
    print("Fizz")
  } else if number % 5 == 0 {
    print("Buzz")
  } else {
    print(number)
  }
}

