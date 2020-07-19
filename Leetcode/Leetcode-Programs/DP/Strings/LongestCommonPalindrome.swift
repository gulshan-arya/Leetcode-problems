//
//  LongestCommonPalindrome.swift
//  Leetcode-Programs
//
//  Created by Gulshan on 17/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import UIKit

class LongestCommonPalindrome: Runnable {
    
    func run() {
        
        print(longestPalindrome("ababab"))
        print(longestPalindrome("babad")) // "aba"
        print(longestPalindrome("cbbd"))  // bb
    }
    
    func longestPalindrome(_ s: String) -> String {
       if s.isEmpty { return s }
             
             let arr = Array(s)
             let n = arr.count
             var dp = Array(repeating: Array(repeating: false, count: n), count: n)
             var start=0
             var maxLength = 1
             
             for i in 0..<n{
                 dp[i][i]=true
                 if i+1<n && arr[i] == arr[i+1]{
                     dp[i][i+1] = true
                     start = i
                     maxLength = 2
                 }
             }
             
            
             var k = 3
             while (k <= n) {
       
                 // Fix the starting index
                 var i = 0
                 while (i < n - k + 1) {
                    
                     let j = i + k - 1
                     if dp[i + 1][j - 1] && arr[i] == arr[j] {
                        
                         dp[i][j] = true
       
                         if (k > maxLength) {
                             start = i
                             maxLength = k
                         }
                     }
                         
                     i+=1
                 }
                 
                 k+=1
             }
             
             
             var result = ""
             var t = start
             let end = start + maxLength - 1
             while(t<=end) {
                 result = "\(result)\(arr[t])"
                 t += 1
             }
             
             return result
    }
}
