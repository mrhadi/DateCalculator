//
//  UnitTesting.swift
//  UnitTesting
//
//  Created by Hadi Shad on 12/05/2016.
//  Copyright © 2016 Hadi Shad. All rights reserved.
//

import XCTest

class UnitTesting: XCTestCase {
    
    let calUtils = CalendarUtils()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLeapYear() {
        XCTAssertEqual(calUtils.isLeapYear(2000), true)
        XCTAssertEqual(calUtils.isLeapYear(2016), true)
        XCTAssertEqual(calUtils.isLeapYear(1999), false)
        XCTAssertEqual(calUtils.isLeapYear(2020), true)
        XCTAssertEqual(calUtils.isLeapYear(2900), false)
        XCTAssertEqual(calUtils.isLeapYear(2871), false)
    }
    
    func testDaysPerMonth() {
        XCTAssertEqual(calUtils.daysPerMonth(1, year: 2000), 31)
        XCTAssertEqual(calUtils.daysPerMonth(0, year: 2010), 0)
        XCTAssertEqual(calUtils.daysPerMonth(13, year: 1950), 0)
        XCTAssertEqual(calUtils.daysPerMonth(2, year: 2000), 29)
        XCTAssertEqual(calUtils.daysPerMonth(2, year: 1999), 28)
        XCTAssertEqual(calUtils.daysPerMonth(4, year: 2000), 30)
        XCTAssertEqual(calUtils.daysPerMonth(10, year: 2000), 31)
    }
    
    func testDateValidity() {
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "This is my date")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2/9")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2-12-2001")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "12/22/2000")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "0/11/1999")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "12/12/1800")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "28/2/2000")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "31/4/1978")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "21/03/1976")), true)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "01/01/2000")), true)
    }
    
    func testCountDays() {
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "02/06/1983"), toDate: DateClass(strDate: "22/06/1983")), 19)
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "04/07/1984"), toDate: DateClass(strDate: "25/12/1984")), 173)
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "03/01/1989"), toDate: DateClass(strDate: "03/08/1983")), 1979)
    }
}
