Date Calculator v1.0 
====================

This command line tool can calculate the number of full days elapsed between the start and end dates.

Usage syntax:	datecalculator [startdate] [enddate]
Date syntax:	YYYY-MM-DD


For testing this utility you can consider this website as a source:
http://www.timeanddate.com/date/durationresult.html



How we calculate this?
======================
First of all we need to be sure our input parameters are valid and in right format.
We are not going to use any date library for this so all calculation and checks should be coded from scratch.

User passed values as String and for easy calculation we convert it to a custom class named DateClass.
This class gets the date value as string and provide some properties for the day, month and year as interget values.
For comparing dates this class provides another property as DateValue which is an interger type and helps us to compare two dates.

Our main function is countDays and gets two DateClass type parameters and retun result as interget.
It first check to be sure the fromDate < toDate, if not swap it.

Then it checks if both dates are at the same month and year, in this case calculation is easy (Line 166).
If not, check if they are both at the same year, then count days left to the end of the first month + days passed on the second month and also check if there is any full month between.
The most complex one is when we have dates on different years, in this case, we calculate the number of days left till end of the first year + count days in full years between two years + days passed on second year.



Development Platform
====================
Xcode 7.2
Swift 2.1
Mac OS X 10.9



Where to find the compiled release version?
===========================================
[Project Directory]\Release