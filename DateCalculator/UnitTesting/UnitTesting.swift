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
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2-9")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2001-12-2")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2000-22-12")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "1999-11-0")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "1800-12-12")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2000-2-28")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "1978-4-31")), false)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "1976-03-21")), true)
        XCTAssertEqual(calUtils.isValidDate(DateClass(strDate: "2000-01-01")), true)
    }
    
    func testCountDays() {
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "1983-06-02"), toDate: DateClass(strDate: "1983-06-22")), 19)
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "1984-07-04"), toDate: DateClass(strDate: "1984-12-25")), 173)
        XCTAssertEqual(calUtils.countDays(DateClass(strDate: "1989-01-03"), toDate: DateClass(strDate: "1983-08-03")), 1979)
    }
}
