--------------------------------------------------------------------------------
-- rectangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: rectangle
-- Description: Open Euphoria library for a rectangle class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: rectangle
--
-- This library module provides the necessary definitions for a **rectangle** object.
--
-- A **rectangle** is a specific entity, intended for direct use. It inherits from
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
--=== The rectangle class
--*/
--------------------------------------------------------------------------------
export type rectangle(object o) -- t(o -> (t(sh) -> t(m))) -> r
    return shape(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* sequence wh - the dimension(s) of the shape - {width,height}
    --===== Quasi-properties (here because we need overriding capability)
    --* atom area
    --* atom perimeter
    --==== Methods
    export function Rectangle(sequence wh) -- f([a]) -> r
        shape sh = Shape(wh)
        put(sh, "area", r_area)
        put(sh, "perim", r_perim)
        return sh
    end function
    function _rarea(sequence wh) -- f([a]) -> a
        return wh[1] * wh[2]
    end function
    constant r_area = routine_id("_rarea")
    function _rperim(sequence wh) -- f([a]) -> a
        return 2 * (wh[1] + wh[2])
    end function
    constant r_perim = routine_id("_rperim")
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
