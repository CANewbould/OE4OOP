--------------------------------------------------------------------------------
-- OE4OOP/person.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: person.e
--Description: a simple person "class" using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.27
--Status: complete, but extensible; operational
--Changes:]]]
--* fully documented
--
--==Open Euphoria for OOP (OE4OOP) library: person
--
-- The purpose of this library module is:
--
--* to define a //person// "class" in such a way as to make future expansion
--  simple.
--* to store (locally) instances/entities and their current property values
--* to issue unique person ids which enable users of this module to link to
--  the stored instances/entities at the level of abstraction determined in
--  the class definition
--* to control if and how instance property values are accessed and changed
--
-- For illustrative purposes this person "class" has just two "properties":
--
--* name
--* dob
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
-- <eucode>include person.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include person.e</eucode>
-- if using for purposes of inheritance.
--
--NB.
--
-- The scope values declared in this file anticipate use for inheritance.
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes (only standard OE libraries) - made public for convenience
--*/
--------------------------------------------------------------------------------
public include std/datetime.e -- for 'diff', 'format', 'new', 'now'
public include std/types.e -- for 'string'
--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------
constant VOID = 0 -- for functions without specific return values
--------------------------------------------------------------------------------
-- Pointers to Properties, so order is important, but only once defined (here)
--------------------------------------------------------------------------------
enum NAME, DOB
--------------------------------------------------------------------------------
-- Data variables
--------------------------------------------------------------------------------
sequence persons = {} -- for storage of instance/entity sub-sequences
integer personage = 0 -- index to 'persons' storage and, when assigned, the
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
export type person(integer this) -- [pointer/index] positive integer
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
--==== Accessors
--*/
--------------------------------------------------------------------------------
public function getName(person this) --> [string] 'name' property
    return persons[this][NAME]
end function
--------------------------------------------------------------------------------
public function getDob(person this) --> [string] 'dob' property, as dd, Month, yyyy
    return format(persons[this][DOB], "%d %B, %Y")
end function
--------------------------------------------------------------------------------
--/*
--==== Mutator
--*/
--------------------------------------------------------------------------------
public function changeName(person this, string name) --> void - overwrites 'name' property
    persons[this][NAME] = name
    return VOID
end function
--------------------------------------------------------------------------------
--/*
--==== Information routine
--*/
--------------------------------------------------------------------------------
public function getAge(person this) --> [integer] estimated age
    datetime today = now()
    return floor(diff(persons[this][DOB], today)/(3600*24*365)) -- bit crude
end function
--------------------------------------------------------------------------------
--/*
--==== Constructor
--
-- Constructors in OE4OOP are necessary to ensure that the instance/entity
-- is suitably populated and abstracted.
--*/
--------------------------------------------------------------------------------
export function Person(string name, sequence dmy) --> [person] unique id
    datetime dob = new(dmy[DAY], dmy[MONTH], dmy[YEAR])
    persons = append(persons, {name, dob})
    personage += 1
    return personage -- a serial number; index to storage
end function
--------------------------------------------------------------------------------
--/*
--Parameters:
--# //name//: the full name by which the person is to be called
--# //dmy//: date-of birth, in the format {dd, [m]m, [yy]yy}
--
--Returns:
--
-- a **person**: the unique id that is the only visible connection with the
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
