--------------------------------------------------------------------------------
-- dates.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: dates
-- Description: Open Euphoria application applied to the date class
--[[[Version: 4.1.0.2
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * re-cast for CANOE
--
------
--== A simple approach to OOP using Open Euphoria: dates
--
-- This test application demonstrates how to create OE4OOP objects and apply
-- methods to those objects.
--
-- The **dob** class inherits from **ymd** - the essential date class, some of
-- whose methods are called.
--
----*/
--------------------------------------------------------------------------------
--
-- Define data and output information
--
--------------------------------------------------------------------------------
include date.e -- for 'Date', 'Month', 'ymd'
ymd ae = Date({1897,3,14})
--------------------------------------------------------------------------------
-- Choose output destination
--------------------------------------------------------------------------------
with define IUP
include io.e -- for 'write', 'writef', 'writefln', 'writeln'
writef(Month(ae,TRUE), "Albert Einstein was born in %s;")
writefln(DayInYear(ae)," on the %d day in that year.")
include dob.e -- for 'Age', 'dob', 'Dob'
dob mine = Dob({1943,5,16})
writefln(Age(mine), "I am %d.")
ymd tdy = Today()
writef(Display(tdy), "Today is %s, ")
writef(Display(tdy,"-"),"or %s ")
writef(Display(tdy,":",TRUE),"or %s")
writefln(DayInYear(tdy),"; it is the %dth day of the year.")
writef(Year(tdy), "%d is ")
include boolean.e -- for 'iif', 'TRUE'
write(iif(IsLeapYear(tdy), "","not "))
writeln("a leap year.")
--------------------------------------------------------------------------------
-- Set heading and display
--------------------------------------------------------------------------------
display("This application tests a base class and an inherited one")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * switched to CANOE's io routines
--  * added more documentation
--  * added use of CANOE's 'boolean'
--  * modified leap-year test to include the year
--  * added test for ##DayInYear##
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
