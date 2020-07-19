
//
//  AllAnagramSearch.swift
//  Leetcode-Programs
//
//  Created by Gulshan on 19/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import UIKit

class AllAnagramSearch: Runnable {
    
   func run() {
        
        print(findAnagrams("cbaebabacd", "abc")) // should print [0,6]
    }
    
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        var substringDict = [Character: Int]()
        for sub in p {
            substringDict[sub, default: 0] += 1
        }
        var result = [Int]()
        var slidingWindowDict = [Character: Int]()
        var start = 0
        let arr = Array(s)
        let substringCount = getValueCount(substringDict)
        for char in arr {
            
            slidingWindowDict[char, default: 0] += 1
            
            if getValueCount(slidingWindowDict) == substringCount {
                
                if isAnagram(substringDict, slidingWindowDict) {
                    result.append(start)
                }
                
                if slidingWindowDict[arr[start]]! <= 1 {
                    slidingWindowDict.removeValue(forKey: arr[start])
                } else {
                    slidingWindowDict[arr[start]]! -= 1
                }
                
                start += 1
            }
        }
        
        return result
    }
    
    private func isAnagram(_ dict1: [Character: Int], _ dict2: [Character: Int]) -> Bool {
        for (key, value) in dict1 {
            if dict2[key] != value {
                return false
            }
        }
        
        return true
    }
    
    private func getValueCount(_ dict: [Character: Int]) -> Int {
        return dict.reduce(0) { (result , arg1)  in
            let (_, v) = arg1
            return result + v
        }
    }
}
