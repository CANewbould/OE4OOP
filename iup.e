--------------------------------------------------------------------------------
-- OE4OOP/iup.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: iup.e
--Description: IUP GUI interface library using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.30
--Status: incomplete, but extensible; operational
--Changes:]]]
--* corrected error in abort action
--* added caution to documentation
--
--==Open Euphoria for OOP (OE4OOP) library: iup
--
-- The purpose of this library module is:
--
--* to define an 'iup' class for managing IUP sessions
--
-- The library contains a single type:
--
--* **iup** - an extension of **clib**
--
-- with the corresponding Constructor and various //action// methods.
--
-- A new concept, the 'Defined Instance' is introduced here: in this case
-- it is the handle to the IUP C-language library for the given machine.
-- 
-- Also included are 'Defined Routines' which operate within the IUP
-- environment but do not require a top-level window set-up.
--
-- Failure to access this library results in OE aborting the session.
--
-- To invoke this library add:
-- <eucode>include iup.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include iup.e</eucode>
-- if using for purposes of inheritance.
------
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
public include clib.e -- for 'clib', 'Clib', 'crid', 'Crid'
public include std/machine.e -- for 'allocate_string'
--------------------------------------------------------------------------------
--/*
--=== Constants
--*/
--------------------------------------------------------------------------------
-- Added C-language values
--------------------------------------------------------------------------------
export constant C_STRING = C_POINTER
export constant VOID = 0
--------------------------------------------------------------------------------
--/*
--=== "Class" clib
--*/
--------------------------------------------------------------------------------
type iup(clib this) --> OE-generated handle to a shared IUP library file
    return TRUE -- inheritance
end type
--------------------------------------------------------------------------------
--/*
--=== "Methods"
--
-- The function names are self-explanatory.
-- A simple code is used to indicate the return value and its type
--*/
--------------------------------------------------------------------------------
--/*
--==== Constructor
--*/
--------------------------------------------------------------------------------
function Iup(sequence dllorso) -- [iup] handle|0
    return Clib(dllorso) -- OE-determined value
end function
--------------------------------------------------------------------------------
--/*
--==== Session management methods
--*/
--------------------------------------------------------------------------------
public function Close(iup this) -- void
    crid c = Crid("+IupClose", this)
    c_proc(c, {})
    return VOID
end function
--------------------------------------------------------------------------------
public function Loop(iup this)
    atom ml = Crid("+IupMainLoop", this, , C_INT)
    return c_func(ml, {})
end function
--------------------------------------------------------------------------------
public function Open(iup this) -- [integer] IUP_OPENED|IUP_ERROR|IUP_NOERROR
    crid o = Crid("+IupOpen", this, {C_INT, C_STRING}, C_INT)
    return c_func(o, {NULL, NULL})
end function
--------------------------------------------------------------------------------
--/*
--=== Defined Instance
--
-- The library may not be found if the paths are not set appropriately.
--*/
--------------------------------------------------------------------------------
public clib IUP = Iup({"iup.dll", "libiup.so"})
if IUP < 1 then
    puts(1, "!!! IUP library not found !!!\n*** ABORTING ***") abort(0)
end if
--------------------------------------------------------------------------------
--/*
--=== Defined Routines
--*/
--------------------------------------------------------------------------------
--/*
--==== Reporting Routines
--*/
--------------------------------------------------------------------------------
public function Message(string caption, string message) -- void - displays a modal message-box
    crid m = Crid("+IupMessage", IUP, {C_STRING, C_STRING})
    c_proc(m, {allocate_string(caption), allocate_string(message)})
    return VOID
end function
--------------------------------------------------------------------------------
--/*
--==== Information Routine
--*/
--------------------------------------------------------------------------------
public function Version() -- [string] IUP GUI version number to 2 decimal places
    crid v = Crid("+IupVersionNumber", IUP, {}, C_INT)
    return sprintf("%.2f", c_func(v, {})/100000)
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.29
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* **iup** defined
--* ##Iup## defined
--* ##Close## defined
--* ##Open## defined
--* ##Loop## defined
--* ##Message## defined
--* ##Version## defined
--------------------------------------------------------------------------------
