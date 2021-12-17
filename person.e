--------------------------------------------------------------------------------
-- OE4OOP/BaMarkIIse1/person.e
--------------------------------------------------------------------------------
-- Notes:
--
-- 
--------------------------------------------------------------------------------
--/*
--= Library: person.e
--Description: an example of a class using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete; operational
--Changes:]]]
--* copied from 'Base1'
--* edited to remove use of 'string' category
--* modified to split the string entirely within this module
--* hence added //sequence.e//
--
--==Open Euphoria for OOP (OE4OOP) library: person
--
-- A basic name class library. This class has three properties:
--
-- * a **string** giving the title of address
-- * a **name** instance
-- * a **dob** instance
--
-- and four methods:
--
-- * ##Person##(string,string,dob) - the Constructor
-- * ##Hello##(person) - a salutation
-- * ##Promote##(person,string) - for title change
-- * ##ChangeName##(person,string) - for name change
--
-- Note that these last two functions work quite differently. In the first
-- case part of the 'person' instance data is changed; in the second only
-- the data in the 'name' instance is changed.
--
-- To use this library ensure that:
-- <eucode>[public ]include person.e</eucode>
-- is included in the calling module (library or application).
--
--==Interface
--
--=== Includes - needs both names & dob
--
--*/
--------------------------------------------------------------------------------
public include name.e -- for 'name', 'Name'
public include dob.e -- for 'dob', 'Dob'
include std/sequence.e -- for 'split'
public include std/types.e -- for 'string'
--------------------------------------------------------------------------------
--/*
--=== Class: person
--*/
--------------------------------------------------------------------------------
export type person(integer this) -- [person]
    return inst(this) -- inheritance - from Base Class
    end type
    enum TITLE, NAME, DOB -- property pointers to data {string,name,dob}
    export function Person(string title, string names, sequence dob) --> [person]
        return New({title, Name(split(names)), Dob(dob)}) -- uses parent 'constructor'
        end function
    export function Hello(person this) --> [void] Writes "Dear <title> X.. Y..; you are .. years old."
        sequence n = getD(this)
        string nt = n[TITLE]
        inst nn = n[NAME], nd = n[DOB]
        printf(1, "Hello %s %s %s; you are %d years old.\n", {nt} & Dear(nn) & {Age(nd)})
        return VOID
        end function
    export function Promote(person this, string newtitle) --> [void] changes title property
        sequence t = getD(this)
        t[TITLE] = newtitle
        return setD(this, t) -- change the 'title' component of 'this's data
        end function
    export function ChangeName(person this, string newname) --> [void] changes 'name' data
        sequence t = getD(this)
        return setD(t[NAME], split(newname)) -- change the 'name' data in the relevant instance
        end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.14
--Status: complete; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------