-- OE4OOP/circle.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: circle
--Description: a circle "class" library using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified to allow overriding
--
--==Open Euphoria for OOP (OE4OOP) library: circle
--
-- The **circle** class has one property:
--
--* radius
--
-- and two methods:
--
--* ##area##
--* ##perimeter##
--
-- To invoke this library add:
-- <eucode>include circle.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include circle.e</eucode>
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
public include shape2.e -- parent
include std/mathcons.e -- for 'PI'
--------------------------------------------------------------------------------
--/*
--=== "Class" circle
--*/
--------------------------------------------------------------------------------
-- Pointers to additional Properties
--------------------------------------------------------------------------------
enum RADIUS = 3
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
--*/
--------------------------------------------------------------------------------
export type circle(integer this) -- [pointer/index] positive integer
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
function c_area(circle this) --> [atom] area of circle with given radius
    sequence c = getProperties(this)
    atom radius = c[RADIUS]
    return PI * radius * radius
end function
constant C_area = routine_id("c_area")
--------------------------------------------------------------------------------
function c_perimeter(circle this) --> [atom] circumference of circle with given radius
    sequence c = getProperties(this)
    atom radius = c[RADIUS]
    return 2 * PI * radius
end function
constant C_perimeter = routine_id("c_perimeter")
--------------------------------------------------------------------------------
export function Circle(atom radius) --> [circle] unique id
    return Shape({C_area, C_perimeter, radius}) -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
-- Previous versions
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
