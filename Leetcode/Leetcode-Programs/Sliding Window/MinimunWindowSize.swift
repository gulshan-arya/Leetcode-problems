//
//  MinimunWindowSize.swift
//  Leetcode-Programs
//
//  Created by Gulshan on 13/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import UIKit

protocol Runnable {
    func run()
}

class MinimunWindowSize: Runnable {
    
    func run() {
        print(minWindow("ADOBECODEBANC", "ABC"))
        print(minWindow("ADOBCAECODEBANC", "ABC"))
        print(minWindow("A", "AD"))
        print(minWindow("", "AD"))
        print(minWindow("AB", "B"))
        print(minWindow("A", "A"))
        print(minWindow("AD", "AD"))
        print(minWindow("aaaaaaaaaaaabbbbbcdd", "abcdd"))
    }
    
    func minWindow(_ s: String, _ t: String) -> String {
        
        let targetArr = Array(t)
        let sourceArr = Array(s)
        let n = sourceArr.count
        var tMap = [Character: Int]()
        var currentWindow = [Character]()
        var currentWindowMap = [Character: Int]()
        var start = 0
        var minStart = 0
        var minWindowSize = n + 1
        
        targetArr.forEach {  tMap[$0] = tMap[$0, default: 0] + 1 }
        
        func isWindowFound() -> Bool {
            for (key, v) in tMap {
                if currentWindowMap[key] == nil ||  (currentWindowMap[key] != nil && currentWindowMap[key]! < v){
                    return false
                }
            }
            return true
        }
        
        var isFirstWindowFound = false
        for i in 0..<n {
            
            currentWindow.append(sourceArr[i])
            currentWindowMap[sourceArr[i]] = currentWindowMap[sourceArr[i], default: 0] + 1
            
            if !isFirstWindowFound && !isWindowFound() { continue }
            isFirstWindowFound = true
            
            while start <= i && (tMap[sourceArr[start]] == nil || tMap[sourceArr[start]] != nil && tMap[sourceArr[start]]! < currentWindowMap[sourceArr[start]]!)  {
                let element = currentWindow.removeFirst()
                currentWindowMap[element]! -= 1
                start += 1
            }
            
            
            if (minWindowSize >= i-start+1) {
                minStart = start
                minWindowSize = i-minStart+1
            }
            
        }
            
        return minWindowSize > s.count ? "" : getSubstring(sourceArr, start: minStart, end: minWindowSize+minStart)
    }
    
    private func getSubstring(_ s: [Character], start: Int, end: Int) -> String {
        
        var result = ""
        var startP = start
        while startP < end {
            result = "\(result)\(s[startP])"
            startP += 1
        }
        return result
    }
    
    private func minWindowWRONG(_ s: String, _ t: String) -> String {
        
        let targetArr = Array(t)
        let sourceArr = Array(s)
        let n = sourceArr.count
        var tMap = [Character: Int]()
        var currentWindow = [Character]()
        var currentWindowMap = [Character: Int]()
        var start = -1
        var current = 0
        var minWindowSize = Int.max
        
        targetArr.forEach {  tMap[$0] = tMap[$0, default: 0] + 1 }
        
        func isWindowFound() -> Bool {
            for (key, v) in tMap {
                if currentWindowMap[key] == nil ||  (currentWindowMap[key] != nil && currentWindowMap[key]! < v){
                    return false
                }
            }
            return true
        }
        
        while current < n {
            if tMap[sourceArr[current]] != nil {
                start = current
                currentWindow.append(sourceArr[current])
                currentWindowMap[sourceArr[current]] = 1

                if isWindowFound() {
                    if minWindowSize > current - start + 1 {
                        minWindowSize = current - start + 1
                        start = current
                    }
                }
                break
            }
            current += 1
        }
        
        if start == -1 { return "" }
        
        var i = current+1
        while i < n && current < n {
            
            currentWindow.append(sourceArr[i])
            currentWindowMap[sourceArr[i]] = currentWindowMap[sourceArr[i], default: 0] + 1
            
            if isWindowFound() {
                
                if minWindowSize > i -  current + 1 {
                    minWindowSize = i - current + 1
                    start = current
                }
                               
                // shrink window
                let element = currentWindow.removeFirst()
                currentWindowMap[element]! -= 1
                current += 1
                
                while current <= i && tMap[sourceArr[current]] == nil {
                    let element = currentWindow.removeFirst()
                    currentWindowMap[element]! -= 1
                    current += 1
                }
                
                if isWindowFound() {
                    if minWindowSize > i -  current + 1 {
                        minWindowSize = i - current + 1
                        start = current
                    }
                }
                
                print(currentWindow)
            }
                        
            i += 1
        }
        

        if minWindowSize + start > n { return  "" }
        
        i = 0
        var result = ""
        while i < minWindowSize {
            result = "\(result)\(sourceArr[i+start])"
            i += 1
        }
        
        return result
    }
}
