--------------------------------------------------------------------------------
-- shape.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: shape
-- Description: Open Euphoria library for a shape class
--[[[Version: 4.1.0.1
-- Date: 2022.03.17
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: shape
--
-- This library module provides the necessary definitions for a **shape** object.
--
-- A **shape** is a general entity, not intended for direct use, but the
-- shape class acts like an abstract class in other languages.
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
--=== The shape class
--*/
--------------------------------------------------------------------------------
export type shape(object o) -- t(o -> t(m)) -> sh
    return map(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* object dims - the dimension(s) of the shape
    --===== Quasi-properties (here because we need overriding capability)
    --* atom area
    --* atom perimeter
    --==== Methods
    export function Shape(object dims) -- f(o) -> sh
        map sh = new() -- empty object
        put(sh, "dims", dims)
        put(sh, "area", -1) -- default rid
        put(sh, "perim", -1) -- default rid
        return sh
    end function
    public function Area(shape sh) -- f(sh) -> a - public for inheritance
        return call_func(get(sh, "area"), {get(sh, "dims")})
    end function
    public function Perimeter(shape sh) -- f(sh) -> a - public for inheritance
        return call_func(get(sh, "perim"), {get(sh, "dims")})
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
