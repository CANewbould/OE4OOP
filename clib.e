--------------------------------------------------------------------------------
-- OE4OOP/clib.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: clib
--Description: C-language interface library using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.29
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* documentation extended
--* made scope values consistent
--
--==Open Euphoria for OOP (OE4OOP) library: clib
--
-- The purpose of this library module is:
--
--* to define "class"es suitable for accessing C-language libraries.
--
-- The library contains two types:
--
--* **clib** - an OE-derived handle to a C-language dll/so
--* **crid** - an OE-derived handle to a C-language function
--
-- and their corresponding Constructors.
--
-- To invoke this library add:
-- <eucode>include clib.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include clib.e</eucode>
-- if using for purposes of inheritance.
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
public include std/dll.e -- for 'define_c_func', 'open_dll'
public include std/types.e -- for 'string', 'TRUE'
--------------------------------------------------------------------------------
--/*
--=== "Class" clib
--*/
--------------------------------------------------------------------------------
public type clib(atom this) --> OE-generated handle to a shared library file
    return this >= 0 -- 0 indicates 'not found'
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
--*/
--------------------------------------------------------------------------------
public function Clib(sequence dllorso) -- [clib] handle|0
    return open_dll(dllorso) -- OE-determined value
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" crid
--*/
--------------------------------------------------------------------------------
public type crid(integer this) --> OE-generated routine_id
    return this >= -1 -- -1 indicates not found
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
--*/
--------------------------------------------------------------------------------
constant VOID = 0 -- for C-language 'void' return value
--------------------------------------------------------------------------------
public function Crid(string rtnname, clib lib, sequence cargs = {}, atom cret = VOID) --> [crid] handle to specific C-language function | -1
    return define_c_func(lib, rtnname, cargs, cret) -- OE-determined value
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.28
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* **clib** defined
--* ##Clib## defined
--* **crid** defined
--* ##Crid## defined
--------------------------------------------------------------------------------
