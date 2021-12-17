--------------------------------------------------------------------------------
-- OE4OOP/MarkII/name.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: names.e
--Description: an example of a class using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete; operational
--Changes:]]]
--* copied from 'Base1'
--* argument changed
--
--==Open Euphoria for OOP (OE4OOP) library: name
--
-- A basic name class library. This class has a single property:
--
-- * a **string** holding one or more name components, each separated by a space.
-- There is no limit on the number of names entered.
--
-- and two methods:
--
-- * ##Name##(names) - the Constructor
-- * ##Dear##(name) - elements of a typical salutation - [sequence] {n[1],n[$]}
--
-- To use this library ensure that:
-- <eucode>[public ]include name.e</eucode>
-- is included in the calling module (library or application).
--
--==Interface
--
--=== Includes - need core library
--
--*/
--------------------------------------------------------------------------------
include oe4oop.e -- for OE4OOP engine, 'inst'
include std/types.e -- for 'string'
--------------------------------------------------------------------------------
--/*
--=== Class: names
--*/
--------------------------------------------------------------------------------
export type name(integer this) -- [inst]
    return inst(this) -- inheritance - from Base Class
    end type
    export function Name(sequence names) --> [name]
        return New(names) -- uses parent 'constructor'
        end function
    export function Dear(name this) --> [sequence] {firstname, lastname}
        sequence n = getD(this)
        return {n[1], n[$]}
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
--------------------------------------------------------------------------------
-- test
/*
oop:init()
name CAN = Name({"Charles", "Arthur", "Newbould"})
printf(1,"Hello %s %s\n", Dear(CAN))
*/