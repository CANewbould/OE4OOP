--------------------------------------------------------------------------------
-- vehicle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: vehicle
-- Description: Open Euphoria library for a vehicle class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * revised layout
--  * renamed and revised accessors
--
------
--== A simple approach to OOP using Open Euphoria: vehicle
--
-- This library module provides the necessary definitions for a **vehicle** object.
--
-- A **vehicle** is a general entity, not intended for direct use, but the
-- vehicle class acts like an abstract class in other languages.
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
-- include the OE4OOP engine - made public for inheritance
public include std/map.e -- for 'get', 'map', 'new', 'put'
--------------------------------------------------------------------------------
--/*
--=== The vehicle class
--*/
--------------------------------------------------------------------------------
export type vehicle(object o) -- t(o -> t(m)) -> vh
    return map(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    -- * an **integer** holding the number of wheels the vehicle has
    -- * a **string** holding the method of propulsion
    --==== Methods
    --*/
    export function Vehicle(integer wheels, sequence propn) -- f(i -> [c]) -> vh
        map vh = new() -- empty object
        put(vh, "#wheels", wheels)
        put(vh, "propulsion", propn)
        return vh
    end function
    public function getWheels(vehicle vh) -- f(vh) -> i - public for inheritance
        return get(vh,"#wheels")
    end function
    --constant engines = {"diesel","electric","hybrid","petrol","pedal"}
    public function getPropulsion(vehicle vh) -- f(vh) -> [c] - public for inheritance
        return get(vh, "propulsion")
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
