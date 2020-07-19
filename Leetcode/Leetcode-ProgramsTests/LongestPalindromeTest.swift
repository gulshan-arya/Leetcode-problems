//
//  LongestPalindromeTest.swift
//  Leetcode-ProgramsTests
//
//  Created by Gulshan on 18/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import XCTest
@testable import Leetcode_Programs

class LongestPalindromeTest: XCTestCase {

    private var instance: LongestCommonPalindrome!
    
    override func setUp() {
        instance = LongestCommonPalindrome()
    }

    override func tearDown() {
       instance = nil
    }

    func testBigPalindrome() {
        self.measure {
            XCTAssertEqual(instance.longestPalindrome("ababab"), "ababa")
        }
    }
    
    func testHappyFlow() {
        self.measure {
            XCTAssertEqual(instance.longestPalindrome(""), "")
            XCTAssertEqual(instance.longestPalindrome("babad"), "bab")
            XCTAssertEqual(instance.longestPalindrome("cbbd"), "bb")
            XCTAssertEqual(instance.longestPalindrome("cbbc"), "cbbc")
        }
    }
}
