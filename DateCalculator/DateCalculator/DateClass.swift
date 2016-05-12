//
//  DateClass.swift
//  DateCalculator
//
//  Created by Hadi Shad on 12/05/2016.
//  Copyright © 2016 Hadi Shad. All rights reserved.
//

import Foundation

class DateClass {
    var day         : Int = 0;
    var month       : Int = 0;
    var year        : Int = 0;
    
    // dateValue is being used for comparing dates, we generate an Int value from date string
    
    var dateValue   : Int = 0;
    
    
    // Expect input value with format YYYY-DD-MM
    
    init(strDate: String) {
        let arr = strDate.componentsSeparatedByString("-");
        
        if arr.count == 3 {
            self.year = Int(arr[0])!;
            self.month = Int(arr[1])!;
            self.day = Int(arr[2])!;
            
            self.dateValue = Int(arr[0] + arr[1] + arr[2])!;
        }
    }
}