--------------------------------------------------------------------------------
-- date.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: date
-- Description: Open Euphoria library for a date class
--[[[Version: 4.1.0.2
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: date
--
-- This library module provides the necessary definitions for a **date** object.
--
-- A **date** is a base class.
--
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes
--*/
--------------------------------------------------------------------------------
-- include the OE4OOP engine - made public for inheritance
public include std/map.e -- for 'get', 'map', 'new', 'put'
--------------------------------------------------------------------------------
--/*
--=== The date class
--*/
--------------------------------------------------------------------------------
export type ymd(object o) -- t(o -> t(m)) -> d
    return map(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* integer year
    --* integer month
    --* integer dom
    --==== Methods
    export function Date(sequence yyyymmdd) -- f([c]) -> d
        map d = new() -- empty object
        put(d, "year", yyyymmdd[1])
        put(d, "month", yyyymmdd[2])
        put(d, "dom", yyyymmdd[3])
        return d
    end function
    public function DayInMonth(ymd d) -- f(d) -> i
        return get(d,"dom")
    end function
    constant mdays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    function dupto(integer m) -- f(i) -> i
        switch m do
        case 0,1 then return 0
        case else
            return mdays[m-1] + dupto(m-1)
        end switch
    end function
    public function DayInYear(ymd d) -- f(d) -> i
        integer ret = dupto(Month(d)) + DayInMonth(d)
        if (IsLeapYear(d) and Month(d) > 2) then return ret+1
        else return ret
        end if
    end function
    include boolean.e -- for 'FALSE', 'iif', 'TRUE'
    public function Display(ymd d, sequence sep = "/", integer twosf = FALSE) -- f(d -> [c] -> i) -> [c]
        sequence fmt = iif(twosf,"%02d","%d")
        return sprintf(fmt, DayInMonth(d))
            & sep
            & sprintf(fmt, Month(d))
            & sep
            & sprintf(fmt, Year(d))
    end function
    public function IsLeapYear(ymd d) -- f(d) -> b
        integer y = Year(d)
        if remainder(y, 4) = 0 then
            if remainder(y, 100) = 0 then
                if remainder(y, 400) = 0 then return TRUE
                else return FALSE
                end if
            else return TRUE
            end if
        else return FALSE
        end if
    end function
    sequence months = {"January","February","March","April","May","June","July"
                      ,"August","September","October","November","December"}
    public function Month(ymd d, integer i = 0) -- f(d -> i) -> i|[c]
        integer m = get(d, "month")
        if i then return months[m]
        else return m
        end if
    end function
    public function Today() -- f( -> f) -> d
        sequence tdy = date()
        tdy[1] += 1900 -- base of OE datetime
        return Date(tdy[1..3])
    end function
    public function Year(ymd d) -- f(d) -> i
        return get(d,"year")
    end function
--------------------------------------------------------------------------------
--/*
------
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * added a ##Today## constructor
--  * added argument to ##Display##
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
