--------------------------------------------------------------------------------
-- OE4OOP/soldier.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Test application cast in the form of running a Main procedure
--------------------------------------------------------------------------------
--/*
--= Application: soldier.ex
--Description: a testbed for the "OOP" implementation of OE (OE4OOP), based on
-- the 'soldier' "class", as defined in 'soldier.e'
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.28
--Status: complete, but extensible; operational
--Changes:]]]
--* fully documented
--* re-cast using a ##main##
--
--==Open Euphoria for OOP (OE4OOP) application: soldier
--
-- This simple application illustrates how to create instances/entities and
-- use defined routines ("methods") to operate upon them.
-- It also exploits inheritance of "class" types, for re-use of "method"
-- routines defined in the parent //person// "class".
--
-- To run this (test) example simply enter, into a terminal/command-prompt
-- window, focussed in the OE4OOP project folder, the following:
--<eucode>eui soldier</eucode>
--
------
--*/
--------------------------------------------------------------------------------
-- Interface
--------------------------------------------------------------------------------
-- Includes
--------------------------------------------------------------------------------
include soldier.e -- for 'getAge', 'getName', 'getRank', 'soldier', 'Soldier', 'promote'
include std/console.e -- for 'display'
--------------------------------------------------------------------------------
-- Support routine
--------------------------------------------------------------------------------
procedure show(soldier p)
    display("[1] [2] is [3] years old",
                {getRank(p), getName(p), getAge(p)})
end procedure
--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
procedure main()
    soldier fred = Soldier("Sergeant", "Fred Smith", {16, 5, 1993})
    show(fred)
    soldier bill = Soldier("Captain", "William Jones", {18, 11, 1982})
    show(bill)
    promote(bill, "Major")
    show(bill)
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
