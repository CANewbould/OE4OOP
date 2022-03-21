--------------------------------------------------------------------------------
-- motor.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: motor
-- Description: Open Euphoria library for a motor class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * revised layout
--
------
--== A simple approach to OOP using Open Euphoria: motor
--
-- This library module provides the necessary definitions for a **motor** object.
--
-- A **motor** is a specialised entity, available for direct use, but also
-- enabling more specialised child classes.
--.
-- It inherits from the **vehicle** class.
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
--=== The motor class
--*/
--------------------------------------------------------------------------------
export type motor(object o) -- t(o -> t(vh)) -> m
    return vehicle(o) -- the 'parent'
    end type
    --/*
    --==== Properties (inherited)
    -- * an **integer** holding the number of wheels the vehicle has
    -- * a **string** holding the method of propulsion
    --==== Properties (new)
    -- * a **string** holding the name of the major colour of the motor
    --==== Methods
    --*/
    export function Motor(integer w=4, sequence p="petrol", sequence c) -- f(i->[c]->[c]) -> m
        vehicle m = Vehicle(w,p)
        put(m, "color", c)
        return m
    end function
    public function getColor(motor m) --> f(m) -> [c]
        return get(m,"color")
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
