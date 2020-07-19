//
//  AllAnagramSearchTests.swift
//  Leetcode-ProgramsTests
//
//  Created by Gulshan on 19/07/20.
//  Copyright © 2020 Gulshan. All rights reserved.
//

import XCTest
@testable import Leetcode_Programs

class AllAnagramSearchTests: XCTestCase {

    private var instance: AllAnagramSearch!
    
    override func setUp() {
        instance = AllAnagramSearch()
    }

    override func tearDown() {
       instance = nil
    }

    func testHappyFlow() {
        self.measure {
            XCTAssertEqual(instance.findAnagrams("cbaebabacd", "abc"), [0,6])
            XCTAssertEqual(instance.findAnagrams("BACDGABCDA", "ABCD"), [0,5,6])
            XCTAssertEqual(instance.findAnagrams("AAABABAA", "AABA"), [0,1,4])
        }
    }
}
