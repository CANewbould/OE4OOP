--------------------------------------------------------------------------------
-- name.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: name
-- Description: Open Euphoria library for a name class
--[[[Version: 4.1.0.2
-- Date: 2022.03.18
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: name
--
-- This library module provides the necessary definitions for a **name** object.
--
-- A **name** is a base class.
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
--=== The name class
--*/
--------------------------------------------------------------------------------
export type name(object o) -- t(o -> t(m)) -> n
    return map:map(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* sequence names - an array of strings of inspecified length
    --==== Methods
    --*/
    include ../CANOE/sequence.e -- for 'split'
    export function Name(sequence names) -- f([c]) -> n
        name n = map:new() -- empty object
        put(n, "names", split(names))
        return n
    end function
    public function Dear(name n, integer i = 0) -- f(n -> i) -> [c]
        sequence ns = get(n, "names"), ret = ns[1]
        if (i and length(ns) > 2) then ret &= ' ' & ns[2][1] end if
        return ret & ' ' & ns[$]
    end function
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
--  * changed to use 'split' from CANOE's //string.e//
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
