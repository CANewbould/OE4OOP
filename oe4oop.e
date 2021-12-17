--------------------------------------------------------------------------------
-- OE4OOP/Base1/oe4oop.e
--------------------------------------------------------------------------------
-- Notes:
--
--* The absolute core for an alternative OE4OOP
--------------------------------------------------------------------------------
--/*
--= Library: oe4oop.e
--Description: the core library for an operational solution the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete; operational
--Changes:]]]
--* created
--* **init** defined
--* a //namespace// added
--* documentation extended
--
--==Open Euphoria for OOP (OE4OOP) library: oo4oop
--
-- This is the base library module for an operationally-viable OOP approach
-- using OOP. No other library is required.
--
-- A base //type// **inst** is globally defined.
--
-- It contains four functions which are set as //global// to ensure that
-- they are universally available. These are:
--
--* ##New## - a universal creator function. It takes data as the parameter
--  and returns a pointer to the in-built store, providing appropriate
--  abstraction.
--* ##getD## - a universal accessor function. It takes as the parameter the
--  handle to the object delivered by ##New##.
--* ##setD## - a universal mutator function. It takes two parameters:
--  the handle to the object; the altered property value.
--* ##init## - a once-per-application initialisation routine, which resets
--  the storage to the empty state.
--
-- This library is required for all Mark II modules. Ensure that:
-- <eucode>public include oe4oop.e</eucode>
-- is included in the calling module (library or application).
--
--==Interface
--*/
--------------------------------------------------------------------------------
namespace oop
--------------------------------------------------------------------------------
--
--=== Includes - none here as core library
--
--------------------------------------------------------------------------------
include std/map.e
--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------
constant DATA = 1
global constant EMPTY = {}
global constant VOID = 0
--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------
map objects
integer obj
--------------------------------------------------------------------------------
--/*
--=== Types
--*/
--------------------------------------------------------------------------------
global type inst(integer this) --> this > 0
    return this > 0
end type
--------------------------------------------------------------------------------
--/*
--=== Routines
--*/
--------------------------------------------------------------------------------
global function New(object data) --> [integer] handle to instance
    obj += 1
    map:put(objects, obj, data)
    return obj
end function
--------------------------------------------------------------------------------
global function getD(inst this) --> [object] properties of 'this'
    return map:get(objects, this)
end function
--------------------------------------------------------------------------------
global function setD(inst this, object data) --> [void] sets the properties of 'this'
    map:put(objects, this, data)
    return VOID
end function
--------------------------------------------------------------------------------
public function init() --> [void]
    objects = map:new()
    obj = 0
    return VOID
end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.14
--Status: complete; operational
--Changes:]]]
--* created
--* **New** defined
--* ##getD## defined
--* **setD** defined
--------------------------------------------------------------------------------
