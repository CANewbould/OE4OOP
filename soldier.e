--------------------------------------------------------------------------------
-- OE4OOP/soldier.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: soldier.e
--Description: an example of inheritance using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.28
--Status: complete, but extensible; operational
--Changes:]]]
--* fully documented
--
--==Open Euphoria for OOP (OE4OOP) library: soldier
--
-- The purpose of this library module is:
--
--* to define a //soldier// "class" as an extension of the //person// class
--* to store (locally) instances/entities and their current property values
--* to issue unique person ids which enable users of this module to link to
--  the stored instances/entities at the level of abstraction determined in
--  the class definition
--* to control if and how instance property values are accessed and changed
--
-- For illustrative purposes this soldier "class" has just one additional
-- "property":
--
--* rank
--
-- Adding further properties is easily achieved, as follows:
--
--* add a further tag to the //enum//
--* incorporate another argument into the constructor and re-code appropriately
--* add further accessor and/or mutator functions, as appropriate
--
-- or
--
--* build a (more-specialised) child class, either within this module (usually
--  possible) or via //include//d inheritance in a separate module
--
-- An instance/entity is encapsulated as a (sub)**sequence** within a
-- class-specific store (**sequence**). Its status is always //local//.
-- Its length is determined by the number of properties.
-- A suitable //Constructor// allows the setting of initial values for these
-- properties, uniquely for each and every instance/entity created.
-- Properties can only be changed "externally" if an appropriate
-- //mutator// function is supplied. Only Constructor, //accessor// and
-- //mutator// functions, along with any //information// functions,
-- are given sufficient scope to be available to a calling module.
--
-- To invoke this library add:
-- <eucode>include soldier.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include soldier.e</eucode>
-- if using for purposes of inheritance.
--
--NB.
--
-- The scope values declared in this file do not anticipate use for
-- inheritance.
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes (parent libraries) - made public for convenience
--*/
--------------------------------------------------------------------------------
public include person.e -- parent class
    -- include std/datetime.e -- for 'diff', 'format', 'new', 'now'
    -- include std/types.e -- for 'string', 'TRUE'
--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------
constant VOID = 0 -- for functions without specific return values
--------------------------------------------------------------------------------
-- Pointers to Properties, so order is important, but only once defined (here)
--------------------------------------------------------------------------------
enum PERSON, RANK -- note not re-defining 'person'
--------------------------------------------------------------------------------
-- Data variables
--------------------------------------------------------------------------------
sequence soldiers = {} -- for storage of instance/entity sub-sequences
integer soldr = 0 -- index to 'persons' storage and, when assigned, the
                  -- ID pointer identifying the instance/entity
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
export type soldier(person this)
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
--==== New accessor
--*/
--------------------------------------------------------------------------------
export function getRank(soldier this) --> [string] 'rank' property
    return soldiers[this][RANK]
end function
--------------------------------------------------------------------------------
--/*
--==== New mutator
--*/
--------------------------------------------------------------------------------
export function promote(soldier this, string newRank)
    soldiers[this][RANK] = newRank
    return VOID
end function
--------------------------------------------------------------------------------
--/*
--==== Constructor
--
-- Constructors in OE4OOP are necessary to ensure that the instance/entity
-- is suitably populated and abstracted.
--*/
--------------------------------------------------------------------------------
export function Soldier(string rank, string name, sequence dmy)
    soldiers = append(soldiers, {Person(name, dmy), rank}) -- use parent Constructor  
    soldr += 1
    return soldr -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
--/*
--Parameters:
--# //rank//: the name of the current rank
--# //name//: the full name by which the person is to be called
--# //dmy//: date-of birth, in the format {dd, [m]m, [yy]yy}
--
--Returns:
--
-- a **soldier**: the unique id that is the only visible connection with the
-- instance/entity outside this module.
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.26
--Status: complete, but extensible; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------
