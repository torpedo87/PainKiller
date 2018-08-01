//: Playground - noun: a place where people can play

import UIKit

//public struct HashTable<Key: Hashable, Value> {
//  //손님
//  private typealias Element = (key: Key, value: Value)
//  //방이 모자를 경우 한칸에 여러개 들어갈 수 있음
//  private typealias Bucket = [Element]
//  private var buckets: [Bucket]
//  private(set) public var occupiedCount = 0
//  public var isEmpty: Bool { return occupiedCount == 0 }
//
//
//  public init(capacity: Int) {
//    assert(capacity > 0)
//    //원하는 갯수만큼의 빈 방을 만든다
//    buckets = Array<Bucket>(repeatElement([], count: capacity))
//  }
//
//  //hash func 방 배정에 사용하는 함수
//  private func index(forKey key: Key) -> Int {
//    //key 타입이 hashable 이라서 hashValue를 갖는다
//    return abs(key.hashValue) % buckets.count
//  }
//
//
//
//  //방배정 함수를 통해 방을 찾아서 방의 손님들 중에 한 사람 찾기
//  public func value(forKey key: Key) -> Value? {
//    let index = self.index(forKey: key)
//    for element in buckets[index] {
//      if element.key == key {
//        return element.value
//      }
//    }
//    return nil  // key not in hash table
//  }
//
//  //그방에 기존 손님이 있으면 바꾸고 없으면 그냥 넣기
//  public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
//    let index = self.index(forKey: key)
//
//    // 기존 손님이 있는경우
//    for (i, element) in buckets[index].enumerated() {
//      if element.key == key {
//        let oldValue = element.value
//        //update
//        buckets[index][i].value = value
//        return oldValue
//      }
//    }
//    // 없는경우
//    buckets[index].append((key: key, value: value))
//    occupiedCount += 1
//    return nil
//  }
//
//  //해당 손님 찾아서 빼기
//  public mutating func removeValue(forKey key: Key) -> Value? {
//    let index = self.index(forKey: key)
//
//    for (i, element) in buckets[index].enumerated() {
//      if element.key == key {
//        buckets[index].remove(at: i)
//        occupiedCount -= 1
//        return element.value
//      }
//    }
//    return nil  // key not in hash table
//  }
//
//  public subscript(key: Key) -> Value? {
//    get {
//      return value(forKey: key)
//    }
//    set {
//      //서브스크립트 set 함수에서 newValue 제공한다
//      //hashTable[key] = newValue
//      //setter 는 return 하면 안됨
//      if let value = newValue {
//        updateValue(value, forKey: key)
//      } else {
//        // hashTable[1] = nil
//        removeValue(forKey: key)
//      }
//    }
//  }
//}

public struct HashTable<Key, Value> where Key : Hashable {
  
  typealias Element = (key: Key, value: Value)
  typealias Bucket = [Element]
  var buckets: [Bucket]
  private(set) public var count: Int = 0
  
  public var isEmpty: Bool {
    get {
      return count == 0
    }
  }
  
  public init(capacity: Int) {
    assert(capacity > 0)
    buckets = Array<Bucket>(repeatElement([], count: capacity))
  }
  
  //capacity 값과 index 갯수를 맞춰야 한다
  func index(_ key: Key) -> Int {
    return abs(key.hashValue % buckets.count)
  }
  
  public func value(forKey key: Key) -> Value? {
    let index = self.index(key)
    
    for element in buckets[index] {
      if element.key == key {
        return element.value
      }
    }
    return nil
  }
  
  
  public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
    let index = self.index(key)
    
    for (i, element) in buckets[index].enumerated() {
      if element.key == key {
        let oldValue = element.value
        buckets[index][i].value = value
        return oldValue
      }
    }
    
    let newElement = Element(key: key, value: value)
    buckets[index].append(newElement)
    count += 1
    return nil
  }
  
  public mutating func removeValue(forKey key: Key) -> Value? {
    let index = self.index(key)
    
    for (i, element) in buckets[index].enumerated() {
      if element.key == key {
        buckets[index].remove(at: i)
        count -= 1
        return element.value
      }
    }
    return nil
  }
  
  public subscript(key: Key) -> Value? {
    get {
      return value(forKey: key)
    }
    set {
      if let value = newValue {
        updateValue(value, forKey: key)
      } else {
        removeValue(forKey: key)
      }
    }
  }
}


var hashTable = HashTable<String, String>(capacity: 5)
hashTable["firstName"] = "Steve"   // insert
let x = hashTable["firstName"]     // lookup
hashTable["firstName"] = "Tim"     // update
hashTable["firstName"] = nil       // delete


