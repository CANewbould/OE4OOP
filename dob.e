--------------------------------------------------------------------------------
-- OE4OOP/MarkII/dob.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: dob.e
--Description: an example of a class using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete; operational
--Changes:]]]
--* copied from 'Base1'
--
--==Open Euphoria for OOP (OE4OOP) library: dob
--
-- A basic date-of-birth class library. This class has a single property:
--
-- * a **sequence** holding a date in the form: {yyyy,m,d}.
--
-- and two methods:
--
-- * ##Dob##({yyyy,m,d}) - the Constructor
-- * ##Age##(dob) - integer - current age in years
--
-- To use this library ensure that:
-- <eucode>[public ]include dob.e</eucode>
-- is included in the calling module (library or application).
--
--==Interface
--
--=== Includes - need core library
--
--*/
--------------------------------------------------------------------------------
include oe4oop.e -- for OE4OOP engine, 'inst'
--------------------------------------------------------------------------------
--/*
--=== Class: dob
--*/
--------------------------------------------------------------------------------
public type dob(integer this) -- [inst]
    return inst(this) -- inheritance - from Base Class
    end type
    enum Y, M, D
    public function Dob(sequence ymd) --> [dob]
        return New(ymd) -- uses parent 'constructor'
        end function
    public function Age(dob this) --> [integer] current age in years
        sequence d = getD(this)
        sequence today = date()
        integer age = 1900 + today[Y] - d[Y]
        if today[M] < d[M] then age -= 1
        elsif today[M] = d[M] and today[D] < d[D] then age -= 1
        end if
        return age
        end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.14
--Status: complete; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------
-- test
/*
oop:init()
dob c = Dob({1941, 12, 17})
?Age(c)
*/