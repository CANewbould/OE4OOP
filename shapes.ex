--------------------------------------------------------------------------------
-- shapes.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: shapes
-- Description: Open Euphoria application applied to various shape classes
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * switched to CANOE io routines
--
------
--== A simple approach to OOP using Open Euphoria: shapes
--
-- This test application demonstrates how to create OE4OOP objects and apply
-- methods to those objects.
--
-- This particular example shows overriding in action.
--
--*/
--------------------------------------------------------------------------------
--
-- Start the processes
--
--------------------------------------------------------------------------------
include circle.e -- for 'Area', 'circle', 'Circle', 'Perimeter'
circle c = Circle(20)
include io.e -- for 'display','writef','writefln'
writef(Area(c),"A circle of radius 20 has an area of %.2f ")
writefln(Perimeter(c), "and a perimeter of %.2f.")
include rectangle.e -- for 'Area', 'Perimeter', 'rectangle', 'Rectangle'
rectangle r = Rectangle({10,20})
writef(Area(r), "A rectangle 10x20 has an area of %d ")
writefln(Perimeter(r), "and a perimeter of %d.")
include triangle.e -- for 'Area', 'Perimeter', 'triangle', 'Triangle'
triangle t = Triangle({5,12,13})
writef(Area(t), "A triangle 5x12x13 has an area of %d ")
writefln(Perimeter(t), "and a perimeter of %d.")
--------------------------------------------------------------------------------
--
-- Set heading & output
--*/
--------------------------------------------------------------------------------
display("This application calls the same two functions from three different objects")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
