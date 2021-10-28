--------------------------------------------------------------------------------
-- OE4OOP/shapes.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Test application cast in the form of running a Main procedure
--------------------------------------------------------------------------------
--/*
--= Application: shapes.ex
--Description: a testbed for the "OOP" implementation of OE (OE4OOP), based on
-- the 'shape' "class" and its children, as defined in 'shape.e'
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.28
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* test of //circle// added
--* test of //rectangle// added
--* test of //triangle// added
--
--==Open Euphoria for OOP (OE4OOP) application: shapes
--
-- This simple application illustrates how to create instances/entities and
-- use defined routines ("methods") to operate upon them. It specifically
-- illustrates an approach to overriding of routines.
--
-- To run this (test) example simply enter, into a terminal/command-prompt
-- window, focussed in the OE4OOP project folder, the following:
--<eucode>eui shapes</eucode>
--
------
--*/
--------------------------------------------------------------------------------
-- Interface
--------------------------------------------------------------------------------
-- Includes
--------------------------------------------------------------------------------
include shapes.e -- for 'area', 'circle', 'Circle, 'rectangle', 'Rectangle', 'triangle', 'Triangle'
--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
procedure main()
    circle circ = Circle(20)
    printf(1, "The area of the circle is %.2f\n", area(circ))
    rectangle rect = Rectangle(20, 15)
    printf(1, "The area of the rectangle is %.2f\n", area(rect))
    triangle tri = Triangle(3, 6, 7)
    printf(1, "The area of the triangle is %.2f\n", area(tri))
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main()
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
