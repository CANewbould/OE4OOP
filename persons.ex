--------------------------------------------------------------------------------
-- persons.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: persons
-- Description: Open Euphoria application applied to the person class
--[[[Version: 4.1.0.3
-- Date: 2022.03.18
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified for CANOE io changes
--
------
--== A simple approach to OOP using Open Euphoria: persons
--
-- This test application demonstrates how to create OE4OOP objects and apply
-- methods to those objects.
--
-- It also demonstrates how to handle properties which are themselves objects.
--
----*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Execution: eui persons
--*/
--------------------------------------------------------------------------------
include person.e
person me = Person("Dr","Charles Arthur Newbould",{1943,5,16})
include io.e -- for 'display','writef','writefln','writeln'
writef(getTitle(me),"Hello, %s ")
writef(Dear(getName(me)),"%s - ")
writefln(Age(getDob(me)),"you are %d!")
person fred = Person("Mr","Fred Smith",{1995,1,7})
writefln(Dear(getName(fred)), "Hello, %s!")
writeln("Arise Fred!")
promote(fred, "Sir")
changeName(fred, "Frederick A Smythe")
writef(getTitle(fred),"Now you are %s ")
writefln(Dear(getName(fred)),"%s!")
--------------------------------------------------------------------------------
-- Set heading and initiate output
--------------------------------------------------------------------------------
display("This application tests a class with object properties")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.2
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * switched to CANOE io routines
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * added test for ##promote##
--  * added test for ##changeName##
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
