//
//  Medium_079_Word_Search_Test.swift
//  Solutions
//
//  Created by Di Wu on 8/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_079_Word_Search_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input0: [[Character]] = [
            Array("ABCE"),
            Array("SFCS"),
            Array("ADEE"),
        ]
        let input1: String = "ABCCED"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [[Character]] = [
            Array("ABCE"),
            Array("SFCS"),
            Array("ADEE"),
        ]
        let input1: String = "SEE"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [[Character]] = [
            Array("ABCE"),
            Array("SFCS"),
            Array("ADEE"),
        ]
        let input1: String = "ABCB"
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_004() {
        let input0: [[Character]] = [
            Array("ABCE"),
            Array("SFCS"),
            Array("ADEE"),
            ]
        let input1: String = "SCD"
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_005() {
        let input0: [[Character]] = [
            Array("A"),
            Array("S"),
            Array("A"),
            ]
        let input1: String = "ASA"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_006() {
        let input0: [[Character]] = [
            Array("ABCE"),
            ]
        let input1: String = "BC"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [[Character]], input1: String, expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_079_Word_Search.exist(input0, word: input1)
            assertHelper(result == expected, problemName:self.problemName(), input: input1, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input1, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
