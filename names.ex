--------------------------------------------------------------------------------
-- names.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: names
-- Description: Open Euphoria application applied to the name class
--[[[Version: 4.1.0.2
-- Date: 2022.03.18
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified for CANOE io changes
--
------
--== A simple approach to OOP using Open Euphoria: names
--
-- This test application demonstrates how to create OE4OOP objects and apply
-- methods to those objects.
----*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include name.e -- for 'Dear', 'name', 'Name'
include ../CANOE/io.e -- for 'display','writefln'
--------------------------------------------------------------------------------
--/*
--=== Execution: eui shapes
--*/
--------------------------------------------------------------------------------
name mine = Name("Charles Arthur Newbould")
writefln(Dear(mine,1), "Hello, %s!")
name fred = Name("Fred Smith")
writefln(Dear(fred), "Hello, %s!")
--------------------------------------------------------------------------------
-- Set heading and initiate output
--------------------------------------------------------------------------------
display("This application tests a base-level class definition")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * switched to CANOE io routines
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
