//: Playground - noun: a place where people can play

import UIKit

var str = "011100"

public func solution(_ A : inout [Int], _ B : inout [Int], _ M : Int, _ X : Int, _ Y : Int) -> Int {
  // write your code in Swift 3.0 (Linux)
  
  var startIndex: Int = 0
  var stopCount: Int = 0
  
  while startIndex < A.count {
    
    let lastIndexAndCount = oneTime(&A, &B, X, Y, startIndex: startIndex)
    startIndex += lastIndexAndCount.0
    stopCount += lastIndexAndCount.1
  }
  
  return stopCount
}


func oneTime(_ A : inout [Int], _ B : inout [Int], _ X : Int, _ Y : Int, startIndex: Int) -> (Int, Int) {
  
  var totalWeight: Int = 0
  var totalMember: Int = 0
  var i = startIndex
  var stopFloor = Set<Int>()
  
  while totalWeight < Y && totalMember < X && i < A.count {
    if totalWeight + A[i] > Y {
      return (i, stopFloor.count + 1)
    } else {
      totalWeight += A[i]
      totalMember += 1
      stopFloor.insert(B[i])
      i += 1
    }
  }
  
  return (i, stopFloor.count + 1)
}



public func solution(_ S : inout String) -> String {
  // write your code in Swift 3.0 (Linux)
  
  var nameDict = [String:String]()
  
  let photos = S.components(separatedBy: "\n")
  let cities = Array(Set(photos.map { $0.components(separatedBy: ",")[1] }))
  
  var photosByCity = [[String]]()
  for city in cities {
    var cityGroup = [String]()
    photos.forEach { photo in
      if photo.components(separatedBy: ",")[1] == city {
        cityGroup.append(photo)
      }
    }
    photosByCity.append(cityGroup)
  }
  
  var timeDict = [String:String]()
  for cityGroup in photosByCity {
    cityGroup.forEach { photo in
      let arr = photo.components(separatedBy: ",")
      let time = arr[2]
      timeDict[time] = photo
    }
    let sorted = cityGroup.sorted { (a, b) -> Bool in
      return a.components(separatedBy: ",")[2] < b.components(separatedBy: ",")[2]
    }
    
    for i in 0..<sorted.count {
      let photo = sorted[i]
      let arr = photo.components(separatedBy: ",")
      let nameWithExt = arr[0]
      var number: String = ""
      if i < 9 && sorted.count >= 10 {
        number = "0\(i+1)"
      } else {
        number = "\(i+1)"
      }
      nameDict[arr[0]] = "\(arr[1])\(number).\(nameWithExt.components(separatedBy: ".")[1])".replacingOccurrences(of: " ", with: "")
    }
  }
  
  var result = ""
  photos.forEach { photo in
    let nameWithExt = photo.components(separatedBy: ",")[0]
    let newName = nameDict[nameWithExt]
    result += newName! + "\n"
  }
  return result
}

var ex = "photo.jpg, Warsaw, 2013-09-05 14:08:15\njohn.png, London, 2015-06-20 15:13:22\nmyFriends.png, Warsaw, 2013-09-05 14:07:13\nEiffel.jpg, Paris, 2015-07-23 08:03:02\npisatower.jpg, Paris, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\nnotredame.png, Paris, 2015-09-01 12:00:00\nme.jpg, Warsaw, 2013-09-06 15:40:22\na.png, Warsaw, 2016-02-13 13:33:50\nb.jpg, Warsaw, 2016-01-02 15:12:22\nc.jpg, Warsaw, 2016-01-02 14:34:30\nd.jpg, Warsaw, 2016-01-02 15:15:01\ne.png, Warsaw, 2016-01-02 09:49:09\nf.png, Warsaw, 2016-01-02 10:55:32\ng.jpg, Warsaw, 2016-02-29 22:13:11"

solution(&ex)

var id: Int = 102
let t = String(id).last!
Int(String(t))
