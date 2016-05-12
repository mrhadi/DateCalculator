//
//  main.swift
//  DateCalculator
//
//  Created by Hadi Shad on 12/05/2016.
//  Copyright © 2016 Hadi Shad. All rights reserved.
//

import Foundation

print("\nDate Calculator v1.0");
print("\nIt calculates the number of full days elapsed in between given start and end dates.")
print("\nUsage Syntax: datecalculator [start date] [end date]")
print("Date syntax: DD/MM/YYYY")

let argument = Process.arguments;

if argument.count != 3 {
    print(">> Invalid parameters!\n")
    exit(0);
}

let calendarUtils = CalendarUtils();

var fromDate = DateClass(strDate: argument[1]);
var toDate = DateClass(strDate: argument[2]);

if (calendarUtils.isValidDate(fromDate) && calendarUtils.isValidDate(toDate)) {
    let daysCount = calendarUtils.countDays(fromDate, toDate: toDate);
    
    print(">> \(daysCount) days \n");
}
else {
    print(">> Invalid dates!\n")
}

