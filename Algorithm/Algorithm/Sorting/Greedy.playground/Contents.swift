//: Playground - noun: a place where people can play

import UIKit

//아직 커버하지 못한 지역들
var statesNeeded : Set = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]

//각 방송국의 커버지역
var stations = [String: Set<String>]()
stations["kone"] = ["id", "nv", "ut"]
stations["ktwo"] = ["wa", "id", "mt"]
stations["kthree"] = ["or", "nv", "ca"]
stations["kfour"] = ["nv", "ut"]
stations["kfive"] = ["ca", "az"]

//우리가 최종적으로 필요한 최소한의 방송국들
var finalStations = Set<String>();

//더이상 커버해야할 지역이 남아있지 않을때까지 반복
while !statesNeeded.isEmpty {
  
  //아직 커버못한 지역을 제일 많이 포함하는 방송국
  var bestStation = String()
  //커버한 지역 체크
  var statesCovered = Set<String>()
  
  for station in stations {
    
    //아직 커버하지 못한 지역 중 방송국이 커버할 수 있는 지역들을 비교하여 제일 큰 방송국으로 best station 업데이트
    var covered = statesNeeded.intersection(station.value)
    if covered.count > statesCovered.count {
      bestStation = station.key
      statesCovered = covered
    }
    statesNeeded = statesNeeded.subtracting(statesCovered)
    
    if !bestStation.isEmpty {
      finalStations.insert(bestStation)
    }
  }
}

print(finalStations)
