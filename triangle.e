--------------------------------------------------------------------------------
-- triangle.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: triangle
-- Description: Open Euphoria library for a triangle class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: triangle
--
-- This library module provides the necessary definitions for a **triangle** object.
--
-- A **triangle** is a specific entity, intended for direct use. It inherits from
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
--=== The triangle class
--*/
--------------------------------------------------------------------------------
export type triangle(object o) -- t(o -> (t(sh) -> t(m))) -> t
    return shape(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* sequence abc - the dimension(s) of the shape - {a,b,c}
    --===== Quasi-properties (here because we need overriding capability)
    --* atom area
    --* atom perimeter
    --==== Methods
    export function Triangle(sequence abc) -- f([a]) -> t
        shape sh = Shape(abc)
        put(sh, "area", t_area)
        put(sh, "perim", t_perim)
        return sh
    end function
    function _tarea(sequence abc) -- f([a]) -> a
        -- Heron's formula
        atom a = abc[1]
        atom b = abc[2]
        atom c = abc[3]
        atom s = (a+b+c)/2
        return sqrt(s*(s-a)*(s-b)*(s-c))
    end function
    constant t_area = routine_id("_tarea")
    function _tperim(sequence abc) -- f([a]) -> a
        return abc[1] + abc[2] + abc[3]
    end function
    constant t_perim = routine_id("_tperim")
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
