--------------------------------------------------------------------------------
-- OE4OOP/MarkII/circle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: circle
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
--==Open Euphoria for OOP (OE4OOP) library: circle
--
-- A basic circle class library. This class has three properties:
--
-- * an **atom** holding the radius of the circle.
-- * a //routine-id// for the circle's ##Area## method
-- * a //routine-id// for the circle's ##Perimeter## method
--
-- and two methods:
--
--* ##Area## - the area
--* ##Perimeter## - the perimeter
--
-- To invoke this library add:
-- <eucode>[public ]include circle.e</eucode>
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
include std/mathcons.e -- for 'PI'
--------------------------------------------------------------------------------
function Carea(atom radius) --> [atom]
    return PI * radius * radius
    end function
constant _Carea = routine_id("Carea")
--------------------------------------------------------------------------------
function Cperimeter(atom radius) --> [atom]
    return 2 * PI * radius
    end function
constant _Cperimeter = routine_id("Cperimeter")
--------------------------------------------------------------------------------
--/*
--=== "Class" circle
--*/
--------------------------------------------------------------------------------
export type circle(integer this) -- [integer] key to instance store
    return shape(this) -- inheritance
    end type
    export function Circle(atom radius) --> [circle] unique id
        return Shape(radius, {_Carea, _Cperimeter}) -- uses parent 'constructor'
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
