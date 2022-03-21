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
--[[[Version: 4.0.5.5
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.03.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* layout changed
--* using CANOE not std libraries
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
include ../CANOE/c2e.e -- for 'clib', 'Clib', 'crid', 'Crid'
include ../CANOE/sequence.e -- for 'toC'
--------------------------------------------------------------------------------
--/*
--=== Constants
--*/
--------------------------------------------------------------------------------
-- Added C-language values
--------------------------------------------------------------------------------
export constant C_sequence = C_P
export constant VOID = 0
--------------------------------------------------------------------------------
--/*
--=== "Class" clib
--*/
--------------------------------------------------------------------------------
type iup(atom this) --> OE-generated handle to a shared IUP library file
    return clib(this) -- inheritance
    end type
    --/*
    --=== "Methods"
    --*/
    function Iup(sequence dllorso) -- [iup] handle|0
        return Clib(dllorso) -- OE-determined value
    end function
    public function Close(iup this) -- void
        crid c = Crid("+IupClose", this)
        c_proc(c, {})
        return VOID
    end function
    public function Loop(iup this) -- [integer] IUP_NOERROR
        atom ml = Crid("+IupMainLoop", this, , C_I)
        return c_func(ml, {})
    end function
    public function Open(iup this) -- [integer] IUP_OPENED|IUP_ERROR|IUP_NOERROR
        crid o = Crid("+IupOpen", this, {C_I, C_sequence}, C_I)
        return c_func(o, {NULL, NULL})
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== Defined Instance
--*/
public clib IUP = Iup("libiup.so")--{"iup.dll", "libiup.so"})
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
public function Alarm(sequence t, sequence m, sequence b1, object b2 = NULL, object b3 = NULL) -- [integer] number of button selected (1-based)
    crid a = Crid("+IupAlarm", IUP, {C_sequence, C_sequence, C_sequence, C_P, C_P}, C_I)
    t = toC(t)
    m = toC(m)
    b1 = toC(b1)
    if sequence(b2) then
        toC(b2)
        if sequence(b3) then b3 = toC(b3) end if
    end if
    return c_func(a, {t, m, b1, b2, b3})
end function
--------------------------------------------------------------------------------
public function Help(sequence url) --> [integer] success|failure
    crid h = Crid("+IupHelp", IUP, {C_sequence}, C_I)
    return c_func(h, {toC(url)})
end function
--------------------------------------------------------------------------------
public function Message(sequence caption, sequence message) -- void - displays a modal message-box
    crid m = Crid("+IupMessage", IUP, {C_sequence, C_sequence})
    c_proc(m, {toC(caption), toC(message)})
    return VOID
end function
--------------------------------------------------------------------------------
--/*
--==== Packaged predefined Dialogs
--*/
--------------------------------------------------------------------------------
include ../CANOE/address.e -- for 'free'
public function GetFile(sequence filename) -- [sequence] {status-code, file-name}
    crid gf = Crid("+IupGetFile", IUP, {C_P}, C_I)
    atom pn = s2c(filename,4096) -- maximum allowed size
    sequence result = {c_func(gf, {pn}), peek_string(pn)}
    free(pn)
    return result
end function
--------------------------------------------------------------------------------
--/*
--==== Information Routine
--*/
--------------------------------------------------------------------------------
public enum VSTR,VNO,VSHOW
public function Version(integer flag=VNO) -- [object] void|IUP GUI version number to 2 decimal places
    switch flag do
    case VNO then
        crid v = Crid("+IupVersionNumber", IUP, {}, C_I)
        return sprintf("%.2f", c_func(v)/100000)
    case VSTR then
        crid v = Crid("+IupVersion", IUP, {}, C_P)
        return peek_string(c_func(v))
    case else
        crid v = Crid("+IupVersionShow", IUP, {})
        c_proc(v)
        return VOID
    end switch
end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.03.16
--Status: incomplete, but extensible; operational
--Changes:]]]
--* ##Version## extended
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.04
--Status: incomplete, but extensible; operational
--Changes:]]]
--* ##Help## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.01
--Status: incomplete, but extensible; operational
--Changes:]]]
--* ##GetFile## defined
--* ##Alarm## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.30
--Status: incomplete, but extensible; operational
--Changes:]]]
--* corrected error in abort action
--* added caution to documentation
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
