--------------------------------------------------------------------------------
-- OE4OOP/person.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Test application cast in the form of running a Main procedure
--------------------------------------------------------------------------------
--/*
--= Application: person.ex
--Description: a testbed for the "OOP" implementation of OE (OE4OOP), based on
-- the 'person' "class", as defined in 'person.e'
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.27
--Status: complete, but extensible; operational
--Changes:]]]
--* fully documented
--
--==Open Euphoria for OOP (OE4OOP) application: person
--
-- This simple application illustrates how to create instances/entities and
-- use defined routines ("methods") to operate upon them.
--
-- To run this (test) example simply enter, into a terminal/command-prompt
-- window, focussed in the OE4OOP project folder, the following:
--<eucode>eui person</eucode>
--
------
--*/
--------------------------------------------------------------------------------
-- Interface
--------------------------------------------------------------------------------
-- Includes
--------------------------------------------------------------------------------
include person.e -- for 'changeName', 'getAge', 'getDob', 'getName', 'person', 'Person'
include std/console.e -- for 'display'
--------------------------------------------------------------------------------
-- Support routine
--------------------------------------------------------------------------------
procedure show(person p)
    display("[1] was born on [2]; so s/he is [3] years old",
                {getName(p), getDob(p), getAge(p)}) -- call all 3 accessors
end procedure
--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
procedure main()
    person fred = Person("Fred Smith", {16, 5, 1943}) -- call Constructor
    show(fred) -- call local routine
    person bill = Person("William Jones", {18, 11, 1982}) -- call Constructor
    changeName(bill, "Wm Ewart Jones") -- call mutator
    show(bill) -- call local routine
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main()
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
