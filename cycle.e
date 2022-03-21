--------------------------------------------------------------------------------
-- cycle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: cycle
-- Description: Open Euphoria library for a cycle class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * revised layout
--
------
--== A simple approach to OOP using Open Euphoria: cycle
--
-- This library module provides the necessary definitions for a **cycle** object.
--
-- A **cycle** is a generalised entity, not intended for direct use.
-- It inherits from the **vehicle** class and acts as a bridge to children.
--
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
public include vehicle.e -- parent - public for inheritance use
--------------------------------------------------------------------------------
--/*
--=== The cycle class
--*/
--------------------------------------------------------------------------------
export type cycle(object o) -- t(o -> t(vh)) -> cy
    return vehicle(o) -- the 'parent'
    end type
    --/*
    --==== Properties (inherited)
    -- * an **integer** holding the number of wheels the vehicle has
    -- * a **string** holding the method of propulsion
    --==== Methods
    --*/
    export function Cycle(integer w = 2, sequence p = "pedal") -- f([i]) -> cy
        return Vehicle(w,p) -- no extra properties
    end function
--------------------------------------------------------------------------------
--/*
------
--*/
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
