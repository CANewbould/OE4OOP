--------------------------------------------------------------------------------
-- OE4OOP/iupw.e
--------------------------------------------------------------------------------
-- Notes:
--
--* This module incorporates a system of embedded documentation.
--* Each code block has its own supporting explanation.
--* For convenience all routines are defined as functions.
--------------------------------------------------------------------------------
--/*
--= Library: iupw.e
--Description: IUP GUI controls interface library using the OE4OOP approach
------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.03.17
--Status: incomplete, but extensible; operational
--Changes:]]]
--* layout changed
--* using CANOE not std libraries
--
--==Open Euphoria for OOP (OE4OOP) library: iupw
--
-- The purpose of this library module is:
--
--* to define the 'iup' control classes for designing IUP applications
--
-- The library contains the following types:
--
--* **Ihandle**
--
-- To invoke this library add:
-- <eucode>include iup.ew</eucode>
-- to the calling module (library or application).
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
public include iup.e -- for IUP, 'Close', 'Loop', 'Open'
include ../CANOE/c2e.e -- for 'crid','Crid'
include ../CANOE/sequence.e -- for 'toC'
include ../CANOE/boolean.e -- for 'TRUE'
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" Ihandle
--*/
--------------------------------------------------------------------------------
type Ihandle(atom this) --> handle to Ihandle structure in IUP
    return this >= 0
    end type
    --/*
    --=== "Methods"
    --*/
    constant C_S = C_P
    export function getAttribute(Ihandle this, sequence attrib) -- [sequence] attribute value
        crid ga = Crid("+IupGetAttribute", IUP, {C_P, C_S}, C_S)
        return peek_string(c_func(ga, {this, toC(attrib)}))
    end function
    export function hide(Ihandle this) -- [integer] IUP_NOERROR
        crid h = Crid("+IupHide", IUP, {C_P}, C_I)
        return c_func(h, {this})
    end function
    export function setAttribute(Ihandle this, sequence attrib, sequence val) -- void
        crid sa = Crid("+IupSetAttribute", IUP, {C_P, C_S, C_S})
        c_proc(sa, {this, toC(attrib), toC(val)})
        return VOID
    end function
    export function IHandle(Ihandle base, sequence attribs) -- [Ihandle] structure with given attribute values
        crid sa = Crid("+IupSetAttributes", IUP, {C_P, C_S}, C_P)
        return c_func(sa, {base, toC(attribs)})
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" dialog
--*/
--------------------------------------------------------------------------------
export type dialog(Ihandle this) --> handle to Dialog structure in IUP
    return TRUE -- inheritance
    end type
    --/*
    --=== "Methods"
    --*/
    constant NULL=0
    export function Dialog(Ihandle child = NULL) -- [dialog] pointer to Dialog structure
        crid d = Crid("+IupDialog", IUP, {C_P}, C_P)
        return c_func(d, {child})
    end function
    export function ProgressDlg() -- [dialog] handle to a pre-defined IUP structure
        crid pd = Crid("+IupProgressDlg", IUP, {}, C_P)
        return c_func(pd, {})
    end function
    export function show(dialog this, integer x = 0, integer y = 0) -- [integer] IUP_NOERROR|IUP_ERROR
        if x > 0 or y > 0 then
            crid sxy = Crid("+IupShowXY", IUP, {C_P, C_I, C_I}, C_I)
            return c_func(sxy, {this, x, y})
        else
            crid s = Crid("+IupShow", IUP, {C_P}, C_I)
            return c_func(s, {this})
        end if
    end function
    export function alarm(dialog this = NULL, sequence title, sequence message, sequence buttons = "OK") -- [integer] the 1-based button chosen
        crid am = Crid("+IupMessageAlarm", IUP, {C_P, C_S, C_S, C_S}, C_I)
        return c_func(am, {this, toC(title), toC(message), toC(buttons)})
    end function
    export function error(dialog this = NULL, sequence message) -- void - issues error message
        crid em = Crid("+IupMessageError", IUP, {C_P, C_S})
        c_proc(em, {this, toC(message)})
        return VOID
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" pdialog
--*/
--------------------------------------------------------------------------------
export type pdialog(Ihandle this) --> handle to a predefined dialog structure in IUP
    return TRUE -- inheritance
    end type
    --/*
    --=== "Methods"
    --*/
    export function ColorDlg() -- [pdialog] handle to a pre-defined IUP structure
        crid cd = Crid("+IupColorDlg", IUP, {}, C_P)
        return c_func(cd, {})
    end function
    export function FileDlg() -- [pdialog] handle to a pre-defined IUP structure
        crid fd = Crid("+IupFileDlg", IUP, {}, C_P)
        return c_func(fd, {})
    end function
    export function FontDlg() -- [pdialog] handle to a pre-defined IUP structure
        crid fd = Crid("+IupFontDlg", IUP, {}, C_P)
        return c_func(fd, {})
    end function
    export function MessageDlg() -- [pdialog] handle to a pre-defined IUP structure
        crid md = Crid("+IupMessageDlg", IUP, {}, C_P)
        return c_func(md, {})
    end function
    export function popup(pdialog this, integer x = 0, integer y = 0) -- [integer] IUP_INVALID|IUP_NOERROR|IUP_ERROR
        crid p = Crid("+IupPopup", IUP, {C_P, C_I, C_I}, C_I)
        return c_func(p, {this, x, y})
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" control
--*/
--------------------------------------------------------------------------------
export type control(Ihandle this) --> handle to control structure in IUP
    return TRUE -- inheritance
    end type
    --/*
    --=== "Methods"
    --*/
    export function setCallback(control this, sequence action, atom rid) -- [crid] the previously allocated callback
        crid sc = Crid("+IupSetCallback", IUP, {C_P, C_S, C_I}, C_I)
        return c_func(sc, {this, toC(action), rid})
    end function
    export function Button(object name = NULL, object action = NULL) -- [control] handle to IUP Button structure
        crid b = Crid("+IupButton", IUP, {C_S, C_S}, C_P)
        if not atom(name) then name = toC(name) end if
        if not atom(action) then action = toC(action) end if
        return c_func(b, {name, action})
    end function
    export function Label(object name = NULL) -- [control] handle to IUP Label structure
        crid l = Crid("+IupLabel", IUP, {C_S}, C_P)
        if not atom(name) then name = toC(name) end if
        return c_func(l, {name})
    end function
    export function Text(object action = NULL) -- [control] handle to IUP Text structure
        crid t = Crid("+IupText", IUP, {C_S}, C_P)
        if not atom(action) then action = toC(action) end if
        return c_func(t, {action})
    end function
    export function Toggle(object name = NULL, object action = NULL) -- [control] handle to IUP Toggle/Checkbox structure
        crid t = Crid("+IupToggle", IUP, {C_S, C_S}, C_P)
        if not atom(name) then name = toC(name) end if
        if not atom(action) then action = toC(action) end if
        return c_func(t, {name, action})
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" container
--*/
--------------------------------------------------------------------------------
export type container(Ihandle this) --> handle to container structure in IUP
    return TRUE -- inheritance
    end type
    --/*
    --=== "Methods"
    --*/
    export function Frame(Ihandle child = NULL) -- [container] handle to the IUP Frame structure
        crid f = Crid("+IupFrame", IUP, {C_P}, C_P)
        return c_func(f, {child})
    end function
    export function Hbox(sequence children = {}) -- [container] handle to IUP Hbox structure
        integer l = length(children)
        crid hb = Crid("+IupHbox", IUP, repeat(C_P, l+1), C_P)
        return c_func(hb, children & NULL)
    end function
    export function Vbox(sequence children = {}) -- [container] handle to IUP Vbox structure
        integer l = length(children)
        crid hb = Crid("+IupVbox", IUP, repeat(C_P, l+1), C_P)
        return c_func(hb, children & NULL)
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--=== "Class" void - the set of void elements
--
--<eucode>type void</eucode>
--=== "Methods"
--*/
    export function Fill() -- [lhandle] handle to a void element
        crid f = Crid("+IupFill", IUP, {}, C_P)
        return c_func(f, {})
    end function
    export function Space() -- [lhandle] handle to a void element
        crid s = Crid("+IupSpace", IUP, {}, C_P)
        return c_func(s, {})
    end function
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
--/*
--==== Working routine - simulating casting in C
--*/
--------------------------------------------------------------------------------
export function Icallback(sequence name, atom rid = routine_id(name)) -- converts a routine_id to the appropriate form
    return machine_func(52,{'+', rid})
end function
--------------------------------------------------------------------------------
--/*
--==== IUP constants
--*/
--------------------------------------------------------------------------------
--/*
--==== Event signals
--*/
--------------------------------------------------------------------------------
export enum CONTINUE = -4, CLOSE, DEFAULT, IGNORE
--------------------------------------------------------------------------------
--/*
------
--/*
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.04
--Status: incomplete, but extensible; operational
--Changes:]]]
--* ##ProgressDlg## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.01
--Status: incomplete, but extensible; operational
--Changes:]]]
--* ##alarm## defined
--* ##FileDlg## defined
--* ##MessageDlg## defined
--* ##FontDlg## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.29
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--* ##setAttribute## defined
--* ##IHandle## defined
--* ##getAttribute## defined
--* **dialog** defined
--* ##Dialog## defined
--* ##show## defined
--* **control** defined
--* ##Button## defined
--* **container** defined
--* ##Hbox## defined
--* ##Vbox## defined
--* ##Label## defined
--* ##setCallback## defined
--* ##Icallback## defined
--* **pdialog** defined
--* ##popup## defined
--* ##ColorDlg## defined
--* ##hide## defined
--* ##error## defined
--* ##Frame## defined
--* ##Fill## defined
--* ##Space## defined
--* ##Text## defined
--* ##Toggle## defined
--------------------------------------------------------------------------------
