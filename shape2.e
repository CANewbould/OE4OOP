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
--Description: an alternative approach to a collection of shape "class"es using the OE4OOP approach
------
--[[[Version: 4.0.5.5
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.26
--Status: incomplete, but extensible; operational
--Changes:]]]
--* adjusted layout to reflect structure intended
--* added //namespace//
--* changed ##initialiseShapes## to ##initialise## accordingly
--
--==Open Euphoria for OOP (OE4OOP) library: shapes
--
-- The base (abstract) "class" //shape// has currently a single property:
--
--* dims - the dimension(s) of the shape
--
-- and two methods:
--
--* area - this holds the code representing the child's routine_id for calculating area
--* perimeter - this holds the code representing the child's routine_id for calculating perimter
--
-- As the methods are to be overridden, they require two quasi-properties in which to store
-- the routine-ids, indexed using:
--
--* //AREA//
--* //PERIMETER//
--
-- The following child "class"es are offered as some of many examples:
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
-- The scope values declared in this file support
-- inheritance of each child class within its own library module.
--
------
--==Interface
--=== Routine
--*/
--------------------------------------------------------------------------------
namespace Shapes
public procedure initialise()
    shapes = {}
    shp = 0
    end procedure
--------------------------------------------------------------------------------
--/*
--=== "Class" shape
--*/
--------------------------------------------------------------------------------
export type shape(integer this) -- [pointer/index] positive integer
    return this > 0 -- base class
    end type
    sequence shapes -- for storage of instance/entity data objects
    integer shp -- index to 'shapes' storage and, when assigned, the
                    -- ID pointer (handle) identifying the instance/entity
    enum DIMS, AREA, PERIMETER -- pointers to (quasi-)properties
    export function getDims(shape this) --> [object] dimension(s) of child shape
        return shapes[this][DIMS]
        end function
    public function area(shape this) --> [atom] area of the relevant shape
        return call_func(shapes[this][AREA], {this})
        end function
    public function perimeter(shape this) --> [atom] perimeter of the relevant shape
        return call_func(shapes[this][PERIMETER], {this})
        end function
    export function Shape(object dims, sequence rids) --> [integer] pointer within shapes
        shapes = append(shapes, {dims} & rids)
        shp += 1
        return shp -- a serial number; index to storage
        end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.22
--Status: incomplete, but extensible; operational
--Changes:]]]
--* modified properties to add 'dims'
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
