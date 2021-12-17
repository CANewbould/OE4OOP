--------------------------------------------------------------------------------
-- OE4OOP/MarkII/triangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: triangle
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
--==Open Euphoria for OOP (OE4OOP) library: triangle
--
-- A basic triangle class library. This class has three properties:
--
-- * a **sequence** holding the dimensions of the triangle
-- * a //routine-id// for the triangle's ##Area## method
-- * a //routine-id// for the triangle's ##Perimeter## method
--
-- and two methods:
--
--* ##Area## - the area
--* ##Perimeter## - the perimeter
--
-- To invoke this library add:
-- <eucode>[public ]include triangle.e</eucode>
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
function Tarea(sequence dims) --> [atom]
    -- Heron's formula
    atom a = dims[A], b = dims[B], c = dims[C], s = (a+b+c)/2
    return sqrt(s*(s-a)*(s-b)*(s-c))
    end function
constant _Tarea = routine_id("Tarea")
--------------------------------------------------------------------------------
function Tperimeter(sequence dims) --> [atom]
    return dims[A] + dims[B] + dims[C]
    end function
constant _Tperimeter = routine_id("Tperimeter")
--------------------------------------------------------------------------------
--/*
--=== "Class" rectangle
--*/
--------------------------------------------------------------------------------
export type triangle(integer this) -- [integer] key to instance store
    return shape(this) -- inheritance
    end type
    enum A, B, C
    export function Triangle(sequence sides) --> [rectange] unique id
        return Shape(sides, {_Tarea, _Tperimeter}) -- uses parent 'constructor'
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
