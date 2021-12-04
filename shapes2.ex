--------------------------------------------------------------------------------
-- OE4OOP/shapes2.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Test application cast in the form of running a Main procedure
--------------------------------------------------------------------------------
--/*
--= Application: shapes.ex
--Description: a testbed for the "OOP" implementation of OE (OE4OOP), based on
-- the 'shape' "class" and its children, as defined in 'shape2.e'
------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.26
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified initialisation to reflect change in class library
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
include circle.e -- for 'circle', 'Circle
    -- include shapes2. e -- for 'area'
include rectangle.e -- for 'rectangle', 'Rectangle'
include triangle.e -- for 'triangle', 'Triangle'
--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
procedure main()
    Shapes:initialise() -- sets count to 0 and empties shapes store
    puts(1, "This little application calls the same-named functions, but "
                & "applied to three different kinds of shape\n\n")
    circle circ = Circle(20)
    printf(1, "The area of the circle, with radius 20, is %.2f; ", area(circ))
    printf(1, "with circumference %.2f\n", perimeter(circ))
    rectangle rect = Rectangle(20, 15)
    printf(1, "The area of the rectangle, 20x15, is %.2f; ", area(rect))
    printf(1, "with perimeter %.2f\n", perimeter(rect))
    triangle tri = Triangle(3, 6, 7)
    printf(1, "The area of the triangle (3,6,7) is %.2f; ", area(tri))
    printf(1, "with perimeter %.2f\n", perimeter(tri))
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main()
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.22
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified to reflect changes in class modules
--* added extra commentary
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* added tests for ##perimeter## routines
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
