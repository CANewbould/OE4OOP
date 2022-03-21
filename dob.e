--------------------------------------------------------------------------------
-- dob.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: dob
-- Description: Open Euphoria library for a dob class
--[[[Version: 4.1.0.2
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: dob
--
-- This library module provides the necessary definitions for a **dob** object.
--
-- A **dob** is a specific entity, intended for direct use. It inherits from
-- the **date** class.
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
public include date.e -- parent - public for inheritance use
--------------------------------------------------------------------------------
--/*
--=== The dob class
--*/
--------------------------------------------------------------------------------
export type dob(object o) -- t(o -> (t(ymd) -> t(m))) -> dob
    return ymd(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* integer year
    --* integer month
    --* integer dom
    --==== Methods
    export function Dob(sequence yyyymmdd) -- f([c]) -> d
        return Date(yyyymmdd)
    end function
    public function Age(dob d) -- f(dob) -> i
        ymd tdy = Today()
        integer age = Year(tdy) - Year(d)
        integer mt = Month(tdy), md = Month(d)
        if mt < md then return age - 1
        elsif mt = md and DayInMonth(tdy) < DayInMonth(d) then return age - 1
        else return age
        end if
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
--  * recast ##Age## using functions from 'date'
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
