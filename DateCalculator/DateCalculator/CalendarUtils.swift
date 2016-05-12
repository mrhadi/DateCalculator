//
//  CalendarUtils.swift
//  DateCalculator
//
//  Created by Hadi Shad on 12/05/2016.
//  Copyright © 2016 Hadi Shad. All rights reserved.
//

import Foundation

class CalendarUtils {
    
    let Feb = 2
    
    let _30dayMonths = [4, 6, 9, 11];               // Apr, Jun, Sep, Nov
    let _31dayMonths = [1, 3, 5, 7, 8, 10, 12];     // Jan, Mar, May, Jul, Aug, Oct, Dec
    let _28dayMonths = [2];                         // Feb
    
    let rangeYear   = 1901...2999
    let rangeMonth  = 1...12
    let rangeDay    = 1...31
    
    let leapYear    = 366
    let normalYear  = 365
    
    
    //  A leap year has 366 days, extra day is on 29th Feb
    
    func isLeapYear(year: Int) -> Bool {
        
        if (year % 4 == 0) {
            if (year % 100 != 0) {
                return true;
            }
            else if (year % 400 != 0) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            return false;
        }
    }
    
    
    //  Return how many days we have in a month
    
    func daysPerMonth(month: Int, year: Int) -> Int {
        if (_30dayMonths.contains(month)) {
            return 30;
        }
        else if (_31dayMonths.contains(month)) {
            return 31;
        }
        else if (month == Feb) {
            if (isLeapYear(year)) {
                return 29;
            }
            else {
                return 28;
            }
        }
        
        return 0;
    }
    
    
    //  Checks for date validity
    
    func isValidDate(date: DateClass) -> Bool {
        let day = date.day;
        let month = date.month;
        let year = date.year;
        
        if !rangeYear.contains(year) {
            return false;
        }
        
        if !rangeMonth.contains(month) {
            return false;
        }
        
        if !rangeDay.contains(day) {
            return false;
        }
        
        if day == 31 && !_31dayMonths.contains(month) {
            return false;
        }
        
        if day == 30 && !_30dayMonths.contains(month) {
            return false;
        }
        
        if isLeapYear(year) && month == Feb && day != 29 {
            return false;
        }
        
        if month == Feb && day > 28 {
            return false;
        }
        
        return true;
    }
    
    
    //  Calculates how many days left to the end of the month
    
    private func daysLeftInMonth(date: DateClass) -> Int {
        if _30dayMonths.contains(date.month) {
            return 30 - date.day;
        }
        else if _31dayMonths.contains(date.month) {
            return 31 - date.day;
        }
        else if isLeapYear(date.year) {
            return 29 - date.day;
        }
        else {
            return 28 - date.day;
        }
    }
    
    
    //  Calculates how many days left to the end of the year
    
    private func daysLeftInYear(date: DateClass) -> Int {
        var countDays = daysLeftInMonth(date);
        
        for var month = date.month + 1; month <= 12; month++ {
            countDays += daysPerMonth(month, year: date.year);
        }
        
        return countDays;
    }
    
    
    // Calculates how many days passed from beginning of the year
    
    private func daysPassedInYear(date: DateClass) -> Int {
        var countDays = date.day - 1;
        
        for var month = 1; month <= date.month - 1; month++ {
            countDays += daysPerMonth(month, year: date.year);
        }
        
        return countDays;
    }
    
    
    // Main function to calculate full days between two days
    
    func countDays(var fromDate: DateClass, var toDate: DateClass) -> Int {
        if fromDate.dateValue > toDate.dateValue {
            let tmpDate = fromDate;
            
            fromDate = toDate;
            toDate = tmpDate;
        }
        
        var countDays = 0;
        
        if fromDate.month == toDate.month && fromDate.year == toDate.year {
            countDays = toDate.day - fromDate.day - 1;
        }
        else if fromDate.year == toDate.year {
            countDays += daysLeftInMonth(fromDate);
            countDays += toDate.day - 1;
            
            for month in (fromDate.month + 1)..<toDate.month {
                countDays += daysPerMonth(month, year: fromDate.year);
            }
        }
        else {
            countDays += daysPassedInYear(toDate);
            countDays += daysLeftInYear(fromDate);
            
            for var year = fromDate.year + 1; year < toDate.year; year++ {
                if isLeapYear(year) {
                    countDays += leapYear;
                }
                else {
                    countDays += normalYear
                }
            }
        }
        
        return countDays;
    }
}

