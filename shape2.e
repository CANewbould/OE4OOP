-- OE4OOP/shape2.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: shapes2
--Description: a alternative approach to a collection of shape "class"es using the OE4OOP approach
------
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.22
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified properties to add 'dims'
--
--==Open Euphoria for OOP (OE4OOP) library: shapes--
-- The base (abstract) "class" //shape// has currently a single property:
--
--* dims - the dimension(s) of the shape
--
-- and two methods:
--
--* area - this holds the code representing the child's routine_id for calculating area
--* perimeter - this holds the code representing the child's routine_id for calculating perimter
--
-- As the methods are to be overridden, they look more like properties.
--
-- The child "class"es are offered as some of many examples:
--
--* circle
--* rectangle
--* triangle
--
-- To invoke this library add:
-- <eucode>include shapes2.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include shapes2.e</eucode>
-- if using for purposes of inheritance.
--
--NB.
--
-- The scope values declared in this file would need to be changed to yield
-- inheritance if each child class had its own library module.
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
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--=== "Class" shape
--*/
--------------------------------------------------------------------------------
-- Pointer to Property
--------------------------------------------------------------------------------
enum DIMS, AREA, PERIMETER
--------------------------------------------------------------------------------
-- Data variables
--------------------------------------------------------------------------------
sequence shapes -- for storage of instance/entity data objects
integer shp -- index to 'shapes' storage and, when assigned, the
                -- ID pointer (handle) identifying the instance/entity
--------------------------------------------------------------------------------
export type shape(integer this) -- [pointer/index] positive integer
    return this > 0
end type
--------------------------------------------------------------------------------
-- Routines
--------------------------------------------------------------------------------
public procedure initialiseShapes()
    shapes = {}
    shp = 0
end procedure
--------------------------------------------------------------------------------
--/*
--=== "Methods"
--
-- The function names are self-explanatory.
-- A simple code is used to indicate the return value and its type
--*/
--------------------------------------------------------------------------------
--/*
--==== Accessor routine
--*/
--------------------------------------------------------------------------------
export function getDims(shape this)
    return shapes[this][DIMS]
end function
--------------------------------------------------------------------------------
--/*
--==== Information routines
--*/
--------------------------------------------------------------------------------
public function area(shape this) --> [atom] area of the relevant shape
    return call_func(shapes[this][AREA], {this})
end function
--------------------------------------------------------------------------------
public function perimeter(shape this) --> [atom] perimeter of the relevant shape
    return call_func(shapes[this][PERIMETER], {this})
end function
--------------------------------------------------------------------------------
--/*
--==== Constructor
--
--*/
--------------------------------------------------------------------------------
export function Shape(object dims, sequence rids) --> [integer] pointer within shapes
    shapes = append(shapes, {dims} & rids)
    shp += 1
    return shp -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified to work for overriding
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.16
--Status: incomplete, but extensible; operational
--Changes:]]]
--* extracted from shapes1.e
--------------------------------------------------------------------------------
