-- OE4OOP/rectangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: rectangle
--Description: a rectangle "class" library using the OE4OOP approach
------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.22
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified to allow for changes in //shape2.e//
--
--==Open Euphoria for OOP (OE4OOP) library: rectangle
--
-- The **rectangle** class has two properties:
--
--* length
--* breadth
--
-- to denote the two sides, and two methods:
--
--* ##area##
--* ##perimeter##
--
-- To invoke this library add:
-- <eucode>include rectangle.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include rectangle.e</eucode>
-- if using for purposes of inheritance.
--
------
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
include shape2.e -- parent
--------------------------------------------------------------------------------
--/*
--=== "Class" rectangle
--*/
--------------------------------------------------------------------------------
-- Pointers to Dimension Elements
--------------------------------------------------------------------------------
enum LENGTH, BREADTH
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
--*/
--------------------------------------------------------------------------------
export type rectangle(integer this) -- [pointer/index] positive integer
    return shape(this) -- inheritance
end type
--------------------------------------------------------------------------------
--/*
--=== "Methods"
--
-- The function names are self-explanatory.
-- A simple code is used to indicate the return value and its type
--*/
--------------------------------------------------------------------------------
--/*
--==== Constructor
--
-- Constructors in OE4OOP are necessary to ensure that the instance/entity
-- is suitably populated and abstracted.
--*/
--------------------------------------------------------------------------------
-- Area calculation
--------------------------------------------------------------------------------
function r_area(rectangle this) --> [atom] area of rectangle of given dimensions
    sequence r = getDims(this)
    return r[LENGTH] * r[BREADTH]
end function
constant R_area = routine_id("r_area")
--------------------------------------------------------------------------------
function r_perimeter(rectangle this) --> [atom] perimeter of rectangle of given dimensions
    sequence r = getDims(this)
    return (r[LENGTH] + r[BREADTH]) * 2
end function
constant R_perimeter = routine_id("r_perimeter")
--------------------------------------------------------------------------------
export function Rectangle(atom len, atom breadth) --> [rectangle] unique id
    return Shape({len, breadth}, {R_area, R_perimeter}) -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified to allow overriding
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.16
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* mainly copied from shapes1.e
--------------------------------------------------------------------------------
