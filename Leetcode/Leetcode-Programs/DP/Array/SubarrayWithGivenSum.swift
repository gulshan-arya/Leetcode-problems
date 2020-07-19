//
//  SubarrayWithGivenSum.swift
//  Leetcode-Programs
//
//  Created by Gulshan on 18/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import UIKit

class SubarrayWithGivenSum: Runnable {
    
    func run() {
        print(subarraySum([8,2,1,4,-2,3,-5,-5,2,1,-4,9], 6)) // should print 4
    }

    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        let n = nums.count
        var currentSum = 0
        var result = 0
        
        for i in 0..<n {
            currentSum += nums[i]
            if currentSum == k {
                result += 1
            }
            
            if dict[currentSum-k] != nil {
                result += dict[currentSum-k]!
            }
            
            dict[currentSum, default: 0] += 1
        }
        
        return result
    }
}
