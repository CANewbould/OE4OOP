--------------------------------------------------------------------------------
-- OE4OOP/shapes1.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: shapes1
--Description: a alternative approach to a collection of shape "class"es using the OE4OOP approach
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.01
--Status: incomplete, but extensible; operational
--Changes:]]]
--* copied from //shapes.e//
--* first property changed
--* introduced use of //switch//
--
--==Open Euphoria for OOP (OE4OOP) library: shapes
--
-- The purpose of this library module is:
--
--* to define a hierarchy of //shape// "class"es in such a way as to make
-- future expansion simple.
--* to store (locally) instances/entities and their current property values
--* to issue unique person ids which enable users of this module to link to
--  the stored instances/entities at the level of abstraction determined in
--  the class definition
--* to control if and how instance property values are accessed and changed
--
-- The base (abstract) "class" //shape// has a single property:
--
--* typ - this holds the code representing the child shape
--
-- The child "class"es are offered as some of many examples:
--
--* circle
--* rectangle
--* triangle
--
-- All such instances/entities are encapsulated as an extended **sequence**
-- within the //shape// store (**sequence**). Its status is always //local//.
-- Its length is determined by the number of properties of the child class.
-- A suitable //Constructor// allows the setting of initial values for
-- each child's set of properties,
-- uniquely for each and every instance/entity created.
-- Properties can only be changed "externally" if an appropriate
-- //mutator// function is supplied. Only Constructor, //accessor// and
-- //mutator// functions, along with any //information// functions,
-- are given sufficient scope to be available to a calling module.
--
-- To invoke this library add:
-- <eucode>include shapes1.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include shapes1.e</eucode>
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
include std/mathcons.e -- for 'PI'
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant TRUE = not 0 -- OE's standard definition locally declared
--------------------------------------------------------------------------------
--/*
--=== "Class" shape
--*/
--------------------------------------------------------------------------------
-- Pointer to Property
--------------------------------------------------------------------------------
enum TYP
--------------------------------------------------------------------------------
-- Pointer to Type(s)
--------------------------------------------------------------------------------
enum CIRCLE, RECTANGLE, TRIANGLE
--------------------------------------------------------------------------------
-- Data variables
--------------------------------------------------------------------------------
sequence shapes = {} -- for storage of instance/entity data objects
integer shp = 0 -- index to 'shapes' storage and, when assigned, the
                -- ID pointer (handle) identifying the instance/entity
--------------------------------------------------------------------------------
type shape(integer this) -- [pointer/index] positive integer
    return this > 0
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
--==== Information routine
--*/
--------------------------------------------------------------------------------
public function area(shape this) --> [atom] area of the relevant shape
    integer rid = -1
    switch shapes[this][TYP] do
    case CIRCLE then rid = C_area
    case RECTANGLE then rid = R_area
    case TRIANGLE then rid = T_area
    end switch
    return call_func(rid, {this})
end function
--------------------------------------------------------------------------------
--/*
------
--/*

--------------------------------------------------------------------------------
--/*
--=== "Class" circle
--*/
--------------------------------------------------------------------------------
-- Pointers to additional Properties
--------------------------------------------------------------------------------
enum RADIUS = 2 -- AREA = 1
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
-- The use of **type** here is three-fold:
--
--* to enable usage: <classname> <entityname> = <Classname>(<args>)
--* for rudimentary type-checking in OE
--* to use as a signal for inheritance - see child class definitions in other
--  modules
--
--*/
--------------------------------------------------------------------------------
export type circle(shape this) -- [pointer/index] positive integer
    return TRUE -- inheritance
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
function c_area(circle this) --> [atom] area of circle with given radius
    atom radius = shapes[this][RADIUS]
    return PI * radius * radius
end function
constant C_area = routine_id("c_area")
--------------------------------------------------------------------------------
export function Circle(atom radius) --> [circle] unique id
    shapes = append(shapes, {CIRCLE, radius})
    shp += 1
    return shp -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" rectangle
--*/
--------------------------------------------------------------------------------
-- Pointers to additonal Properties
--------------------------------------------------------------------------------
enum LENGTH = 2, BREADTH -- AREA = 1
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
-- The use of **type** here is three-fold:
--
--* to enable usage: <classname> <entityname> = <Classname>(<args>)
--* for rudimentary type-checking in OE
--* to use as a signal for inheritance - see child class definitions in other
--  modules
--
--*/
--------------------------------------------------------------------------------
export type rectangle(shape this) -- [pointer/index] positive integer
    return TRUE -- inheritance
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
function r_area(rectangle this) --> [atom] area of rectangle of given dimensions
    return shapes[this][LENGTH] * shapes[this][BREADTH]
end function
constant R_area = routine_id("r_area")
--------------------------------------------------------------------------------
export function Rectangle(atom len, atom breadth) --> [rectangle] unique id
    shapes = append(shapes, {RECTANGLE, len, breadth})
    shp += 1
    return shp -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" triangle
--*/
--------------------------------------------------------------------------------
-- Pointers to additional Properties
--------------------------------------------------------------------------------
enum A = 2, B, C -- AREA = 1
--------------------------------------------------------------------------------
--/*
--=== "class" type
--
-- The use of **type** here is three-fold:
--
--* to enable usage: <classname> <entityname> = <Classname>(<args>)
--* for rudimentary type-checking in OE
--* to use as a signal for inheritance - see child class definitions in other
--  modules
--
--*/
--------------------------------------------------------------------------------
export type triangle(shape this) -- [pointer/index] positive integer
    return TRUE -- inheritance
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
    -- Heron's formula
    atom a = shapes[this][A]
    atom b = shapes[this][B]
    atom c = shapes[this][C]
    atom s = (a+b+c)/2
    return sqrt(s*(s-a)*(s-b)*(s-c))
end function
constant T_area = routine_id("t_area")
--------------------------------------------------------------------------------
export function Triangle(atom a, atom b, atom c) --> [triangle] unique id
    shapes = append(shapes, {TRIANGLE, a, b, c})
    shp += 1
    return shp -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
