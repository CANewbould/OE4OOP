--------------------------------------------------------------------------------
-- OE4OOP/MarkII/rectangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: rectangle
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
--==Open Euphoria for OOP (OE4OOP) library: rectangle
--
-- A basic rectangle class library. This class has has three properties:
--
-- * a **sequence** holding the dimensions of the rectangle
-- * a //routine-id// for the rectangle's ##Area## method
-- * a //routine-id// for the rectangle's ##Perimeter## method
--
-- and two methods:
--
--* ##Area## - the area
--* ##Perimeter## - the perimeter
--
-- To invoke this library add:
-- <eucode>[public ]include rectangle.e</eucode>
-- to the calling module.
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--=== Includes
--*/
--------------------------------------------------------------------------------
public include shape.e -- parent
--------------------------------------------------------------------------------
function Rarea(sequence dims) --> [atom]
    return dims[HEIGHT] * dims[WIDTH]
    end function
constant _Rarea = routine_id("Rarea")
--------------------------------------------------------------------------------
function Rperimeter(sequence dims) --> [atom]
    return 2 * (dims[HEIGHT] + dims[WIDTH])
    end function
constant _Rperimeter = routine_id("Rperimeter")
--------------------------------------------------------------------------------
--/*
--=== "Class" rectangle
--*/
--------------------------------------------------------------------------------
export type rectangle(integer this) -- [integer] key to instance store
    return shape(this) -- inheritance
    end type
    enum HEIGHT, WIDTH -- pointers to properties
    export function Rectangle(sequence sides) --> [rectangle] unique id
        return Shape(sides, {_Rarea, _Rperimeter}) -- uses parent 'constructor'
        end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.15
--Status: complete; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------    
