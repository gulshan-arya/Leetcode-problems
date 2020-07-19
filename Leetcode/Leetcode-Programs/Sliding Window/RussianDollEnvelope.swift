//
//  RussianDollEnvelope.swift
//  Leetcode-Programs
//
//  Created by Gulshan on 14/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import UIKit

// Leetcode 354
// https://leetcode.com/problems/russian-doll-envelopes/
class RussianDollEnvelope: Runnable {

    func run() {
        
        print(maxEnvelopes([[5,4],[6,4],[6,7],[2,3]])) // 3
        print(maxEnvelopes([])) // 0
        print(maxEnvelopes([[1,1]])) // 1
        print(maxEnvelopes([[1,1],[1,1]])) // 1
        print(maxEnvelopes([[1,1],[2,1]])) // 1
        print(maxEnvelopes([[2,1],[3,2]])) // 2
        print(maxEnvelopes([[2,1],[3,2], [3,3]])) // 2
        print(maxEnvelopes([[17,18],[20,4],[4,3],[14,6],[16,4],[8,11],[17,11],[18,7],[20,12]])) // 4
    }
    
    private func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        
        guard !envelopes.isEmpty else { return 0 }
        
        let length = envelopes.count
        let sortedEnvelope = envelopes.sorted(by: {
            $0[0]*$0[1] < $1[0]*$1[1]
        })
        
        var maxV = 1
        var dp = [Int]()
        dp.append(1)
        
        for i in 1..<length {
            dp.append(1)
            for j in 0..<i {
                if sortedEnvelope[i][0] > sortedEnvelope[j][0] && sortedEnvelope[i][1] > sortedEnvelope[j][1] && dp[i] < dp[j] + 1 {
                    dp[i] = dp[j]+1
                }
            }
            maxV = max(maxV, dp[i])
        }
        return maxV
    }
    
    // faster than the upper one
    private func maxEnvelopesBinarySearch(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 1 else { return envelopes.count }
        
        let list = envelopes.sorted(by: {
            if $0[0] == $1[0] { return $0[1] > $1[1] }
            return $0[0] < $1[0]
        })
        
        var result = 0
        var l = 0
        var r = result
        var mid: Int
        
        var heights = [Int](repeating: 0, count: envelopes.count)
        
        for p in list {
            l = 0
            r = result
            while l < r {
                mid = l + (r - l) / 2
                if heights[mid] < p[1] {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            heights[l] = p[1]
            if l == result { result += 1 }
            
            print(result)
        }
        return result
    }
}
