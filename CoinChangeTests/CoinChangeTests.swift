//
//  CoinChangeTests.swift
//  CoinChangeTests
//
//  Created by Michelline Tran on 4/11/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import XCTest
@testable import CoinChange

class CoinChangeTests: XCTestCase {

    let converter = CoinChangeConverter()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testOnePenny() {
        let newValue = converter.convertToChange(value: 0.01)
        XCTAssertEqual(newValue, ChangeSet(quarters: 0, dimes: 0, nickels: 0, pennies: 1))
    }

    func testOneQuarter() {
        let newValue = converter.convertToChange(value: 0.25)
        XCTAssertEqual(newValue, ChangeSet(quarters: 1, dimes: 0, nickels: 0, pennies: 0))
    }

    func testOneDime() {
        let newValue = converter.convertToChange(value: 0.10)
        XCTAssertEqual(newValue, ChangeSet(quarters: 0, dimes: 1, nickels: 0, pennies: 0))
    }

    func testOneNickel() {
        let newValue = converter.convertToChange(value: 0.05)
        XCTAssertEqual(newValue, ChangeSet(quarters: 0, dimes: 0, nickels: 1, pennies: 0))
    }

    func testTwoQuarter() {
        let newValue = converter.convertToChange(value: 0.50)
        XCTAssertEqual(newValue, ChangeSet(quarters: 2, dimes: 0, nickels: 0, pennies: 0))
    }


}
