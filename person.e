--------------------------------------------------------------------------------
-- person.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Module: person
-- Description: Open Euphoria library for a person class
--[[[Version: 4.1.0.4
-- Date: 2022.03.18
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * modified layout
--
------
--== A simple approach to OOP using Open Euphoria: person
--
-- This library module provides the necessary definitions for a **person** object.
--
-- A **person** is a specific entity, intended for direct use. It is a base class
-- but uses two other classes to identify properties.
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
-- include object classes - public for inheritance
public include name.e -- for 'Name'
public include dob.e -- for 'Dob'
--------------------------------------------------------------------------------
--/*
--=== The person class
--*/
--------------------------------------------------------------------------------
export type person(object o) -- t(o -> t(m)) -> p
    return map(o) -- the 'parent'
    end type
    --/*
    --==== Properties
    --* string title
    --* name names
    --* dob dateOfBirth
    --==== Methods
    --*/
    export function Person(sequence title, sequence names, sequence birthday) -- f([c] -> [c] -> [i]) -> p
        map p = new() -- empty object
        put(p, "title", title)
        put(p, "name", Name(names))
        put(p, "dob", Dob(birthday))
        return p
    end function
    constant VOID = 0
    public function changeName(person p, sequence n) -- f(p -> [c]) -> v
        put(p,"name",Name(n))
        return VOID
    end function
    public enum ASPTR=0,ASSTRING,INFULL
    public function getName(person p, integer asstr = ASPTR) -- f(p -> i) -> n|[c]
        switch asstr do
        case ASSTRING then return Dear(get(p,"name"))
        case INFULL then return getTitle(p) & ' ' & Dear(get(p,"name"))   
        case else return get(p,"name")
        end switch
    end function
    public function getDob(person p, integer asstr = ASPTR) -- f(p -> i) -> dob|[c]
        if asstr then return Display(get(p,"dob"),":", 1)
        else return get(p,"dob")
        end if
    end function
    public function getTitle(person p) -- f(p) -> [c]
        return get(p,"title")
    end function
    public function promote(person p, sequence t) -- f(p -> [c]) -> v
        put(p,"title", t)
        return VOID
    end function
--------------------------------------------------------------------------------
--/*
------
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.3
-- Date: 2022.01.10
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * extended option on ##getDob##
--  * extended option on ##getName##
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.2
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * changed to use 'string.e' from CANOE
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
-- Date: 2022.01.09
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * ##promote## defined
--  * ##changeName## defined
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
-- Date: 2022.01.08
-- Author: C A Newbould
-- Status: operational; complete
-- Changes:]]]
--  * created
--------------------------------------------------------------------------------
