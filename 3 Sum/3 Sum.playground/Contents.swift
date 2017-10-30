//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func threeSum(_ nums: [Int]) -> [[Int]] {
    
    let list = nums.sorted()
    var result : [[Int]] = [[Int]]()
    for i in 0...list.count - 3 {
        if i == 0  || list[i] > list[i-1] {
            
            var start = i + 1
            var end = list.count - 1
            while start < end {
                if list[i] + list[start] + list[end]  == 0 {
                    result.append([list[i], list[start], list[end]])
                }
                
                if list[i] + list[start] + list[end] < 0 {
                    let currentStart = start
                    while ( start < end && list[start] == list[currentStart]) {
                        start = start + 1
                    }
                } else {
                    let currentend = end
                    while ( start < end && list[end] == list[currentend]) {
                        end = end - 1
                    }
                }
            }
        }
    }
    return result
}

threeSum([-1,0,1,2,-1,-4])

