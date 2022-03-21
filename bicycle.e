--------------------------------------------------------------------------------
-- bicycle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: bicycle
-- Description: Open Euphoria library for a bicycle class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * revised layout
--
------
--== A simple approach to OOP using Open Euphoria: bicycle
--
-- This library module provides the necessary definitions for a **bicycle** object.
--
-- A **bicycle** is a specific entity, intended for direct use.
-- It inherits from the **cycle** class.
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
public include cycle.e -- parent - public for inheritance use
include std/map.e -- for 'put' - seems not to be properly inherited through 'cycle'
--------------------------------------------------------------------------------
--/*
--=== The bicycle class
--*/
--------------------------------------------------------------------------------
export type bicycle(object o) -- t(o -> (t(cy) -> t(vh))) -> bi
    return cycle(o) -- the 'parent'
    end type
    --/*
    --==== Properties (inherited)
    -- * an **integer** holding the number of wheels the vehicle has
    -- * a **string** holding the method of propulsion
    --==== Properties (new)
    -- * an **integer** holding the number of gears
    --==== Methods
    --*/
    export function Bicycle(sequence p = "pedal", integer gears = 0) -- f(i->i) -> bi
        bicycle b = Cycle(,p)
        put(b,"#gears",gears)
        return b
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
