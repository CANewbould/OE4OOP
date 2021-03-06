--------------------------------------------------------------------------------
-- circle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: circle
-- Description: Open Euphoria library for a circle class
--[[[Version: 4.1.0.2
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: circle
--
-- This library module provides the necessary definitions for a **circle** object.
--
-- A **circle** is a specific entity, intended for direct use. It inherits from
-- the **shape** class.
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
public include shape.e -- parent - public for inheritance use
--------------------------------------------------------------------------------
--/*
--=== The circle class
--*/
--------------------------------------------------------------------------------
export type circle(object o) -- t(o -> (t(sh) -> t(m))) -> ci
    return shape(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* atom radius - the dimension(s) of the shape
    --===== Quasi-properties (here because we need overriding capability)
    --* atom area
    --* atom perimeter
    --==== Methods
    --*/
    export function Circle(atom radius) -- f(a) -> ci
        shape sh = Shape(radius)
        put(sh, "area", c_area)
        put(sh, "perim", c_perim)
        return sh
    end function
    constant PI = 3.14159_26535_89793_23846
    function _carea(atom r) -- f(a) -> a
        return PI * r * r
    end function
    constant c_area = routine_id("_carea")
    function _cperim(atom r) -- f(a) -> a
        return 2 * PI * r
    end function
    constant c_perim = routine_id("_cperim")
--------------------------------------------------------------------------------
--/*
------
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * defined 'PI' intenally
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
