--------------------------------------------------------------------------------
-- vehicles.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: vehicles
-- Description: Open Euphoria application applied to the vehicle class and
-- its descendents
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * switched to CANOE io routines
--  * rearranged output to emphasise inheritance
--
------
--== A simple approach to OOP using Open Euphoria: vehicles
--
-- This test application demonstrates how to create OE4OOP objects and apply
-- methods to those objects.
--
-- This application delves deeper into inheritance.
--
-- The base class is **vehicle**; it has separate children:
--* **cycle**
--* **motor**
--
-- **cycle** has a child class **bicycle**, which only differs in having a fixed
-- property value.
--
----*/
--------------------------------------------------------------------------------
--
-- Motor: output details
--
--------------------------------------------------------------------------------
include motor.e -- for 'motor', 'Motor', 'getColor'
motor car = Motor(,"diesel","red")
include io.e -- for'writef','writefln'
writef(getColor(car),"The %s car ")
-- parent: vehicle -- for 'getPropulsion','getWheels'
writef(getWheels(car),"has %d wheels")
writefln(getPropulsion(car)," and is powered by %s.")
motor reliant = Motor(3,,"yellow")
writef(getColor(reliant),"The %s car ")
writef(getWheels(reliant),"has %d wheels")
writefln(getPropulsion(reliant)," and is powered by %s.")
--------------------------------------------------------------------------------
--
-- Bicycle: output details
--
--------------------------------------------------------------------------------
include bicycle.e -- for 'bicycle', 'Bicycle'
bicycle raleigh = Bicycle("hybrid")
-- grand-parent: vehicle -- for 'getPropulsion','getWheels'
writef(getWheels(raleigh),"The bicycle has %d wheels")
writefln(getPropulsion(raleigh), " and is a %s.")
--------------------------------------------------------------------------------
--
-- Set heading and output
--
--------------------------------------------------------------------------------
display("This application demonstrates inheritance")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
