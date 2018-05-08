//
//  MedianHeap.swift
//  Algorithm
//
//  Created by junwoo on 2018. 5. 8..
//  Copyright © 2018년 samchon. All rights reserved.
//

import Foundation

var tempArr: [Double] = [3, 5, 1, 5, 2, 9, 10, 4]

func findMedian(arr: [Double]) {
  for i in 0..<arr.count-1 {
    let number = arr[i]
    
    var median: Double = 0.0
    
    //enqueue
    if maxHeap.count == 0 {
      maxHeap.enqueue(number)
    } else if maxHeap.peek()! < number {
      minHeap.enqueue(number)
    } else {
      maxHeap.enqueue(number)
    }
    
    //dequeue
    if maxHeap.count - minHeap.count > 1 {
      let move = maxHeap.dequeue()!
      minHeap.enqueue(move)
    } else if minHeap.count - maxHeap.count > 1 {
      let move = minHeap.dequeue()!
      maxHeap.enqueue(move)
    }
    
    if maxHeap.count > minHeap.count {
      median = maxHeap.peek()!
    } else if minHeap.count > maxHeap.count {
      median = minHeap.peek()!
    } else {
      median = (maxHeap.peek()! + minHeap.peek()!) / 2.0
    }
    
    let medianString = String(format: "%.1f", median)
    print(medianString)
  }
}


