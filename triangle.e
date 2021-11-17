-- OE4OOP/triangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: triangle
--Description: a triangle "class" library using the OE4OOP approach
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* mainly copied from shapes1.e
--* modified to allow overriding
--
--==Open Euphoria for OOP (OE4OOP) library: triangle
--
-- The **triangle** class has three properties:
--
--* a
--* b
--* c
--
-- to denote the three sides, and two methods:
--
--* ##area##, calculated using Heron's formula
--* ##perimeter##
--
-- To invoke this library add:
-- <eucode>include triangle.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include triangle.e</eucode>
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
--=== "Class" triangle
--*/
--------------------------------------------------------------------------------
-- Pointers to additional Properties
--------------------------------------------------------------------------------
enum A = 3, B, C
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
--*/
--------------------------------------------------------------------------------
export type triangle(integer this) -- [pointer/index] positive integer
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
function t_area(triangle this) --> [atom] area of triangle of given dimensions
    sequence t = getProperties(this)
    -- Heron's formula
    atom a = t[A]
    atom b = t[B]
    atom c = t[C]
    atom s = (a+b+c)/2
    return sqrt(s*(s-a)*(s-b)*(s-c))
end function
constant T_area = routine_id("t_area")
--------------------------------------------------------------------------------
function t_perimeter(triangle this) --> [atom] perimeter of triangle of given dimensions
    sequence t = getProperties(this)
    return t[A] + t[B] + t[C]
end function
constant T_perimeter = routine_id("t_perimeter")
--------------------------------------------------------------------------------
export function Triangle(atom a, atom b, atom c) --> [triangle] unique id
    return Shape({T_area, T_perimeter, a, b, c})
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
