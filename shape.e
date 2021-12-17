--------------------------------------------------------------------------------
-- OE4OOP/MarkII/shapes.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: shapes.e
--Description: an example of a class using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete; operational
--Changes:]]]
--* copied from 'Base1'
--* documentation extended
--
--==Open Euphoria for OOP (OE4OOP) library: shapes
--
-- A basic shape class library. This class has a three properties:
--
-- * an **object** holding the dimension(s) of the shape
-- * a //routine-id// for the instance-specific ##Area## method
-- * a //routine-id// for the instance-specific ##Perimeter## method
--
-- and two methods:
--
--* Area - the area
--* Perimeter - the perimeter
--
-- The following child "class"es are offered as some of many examples:
--
--* circle
--* rectangle
--* triangle
--
-- To invoke this library add:
-- <eucode>public include shapes.e</eucode>
-- to the calling module.
------
--==Interface
--*/
--------------------------------------------------------------------------------

--
--=== Includes - need core library
--
--*/
--------------------------------------------------------------------------------
public include oe4oop.e -- for OE4OOP engine, 'inst'
--------------------------------------------------------------------------------
--/*
--=== Class: shape
--*/
--------------------------------------------------------------------------------
export type shape(integer this) -- [integer] key to instance store
    return inst(this) -- inheritance - from Base Class
    end type
    export enum DIMS, AREA, PERIMETER -- pointers to properties
    public function Shape(object dims, sequence rids) --> [shape]
        return New({dims} & rids) -- uses parent 'constructor'
        end function
    public function Area(shape this) --> [atom] area of the relevant shape
        sequence s = getD(this)
        return call_func(s[AREA], {s[DIMS]})
        end function
    public function Perimeter(shape this) --> [atom] perimeter of the relevant shape
        sequence s = getD(this)
        return call_func(s[PERIMETER], {s[DIMS]})
        end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--= Library: shapes.e
--Description: an example of a class using the OE4OOP approach
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.15
--Status: complete; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------
