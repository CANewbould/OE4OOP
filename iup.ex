--------------------------------------------------------------------------------
-- OE4OOP/iup.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Test application cast in the form of running a Main procedure
--------------------------------------------------------------------------------
--/*
--= Application: iup.ex
--Description: a testbed for the "OOP" implementation of OE (OE4OOP) as
-- applied to the IUP GUI
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.29
--Status: incomplete, but extensible; operational
--Changes:]]]
--* created
--
--==Open Euphoria for OOP (OE4OOP) application: iup
--
-- This simple application illustrates how to utilise the two IUP module
-- libraries to build GUIs.
--
-- The IUP toolkit is initialised, run and ultimately ended from a loop:
--
--<eucode>Open(IUP)
--  -- GUI design
-- Loop()
-- Close()</eucode>
--
-- A design consists of an inside-out construction of **control**s,
-- arranged within **container**s and placed inside a **dialog**, which is
-- then ##show##n. It is only necessary to declare IUP widgets explicitly
-- if they are referred to elsewhere in the application.
--
-- Sometimes it is necessary to declare a widget's handle outside ##main##
-- especially when the widget is referred to in an event-handler.
--
-- Events are linked to handler functions using the ##setCallback## method.
--
-- Attributes are set using ##setAttribute##; alternatively multiple
-- attributes can be assigned using the ##IHandle## constructor.
--
-- All these ideas are exemplified in this example, so it is important to
-- study the code just as much as to run the application.
--
-- To run this (test) example simply enter, into a terminal/command-prompt
-- window, focussed in the OE4OOP project folder, the following:
--<eucode>eui iup</eucode>
--
------
--*/
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include iupw.e -- for IUP widgets
    -- include iup.e -- for IUP management
--------------------------------------------------------------------------------
-- Variables outside 'main' - moved so that they are visible in event-handlers
--------------------------------------------------------------------------------
dialog d
control l
--------------------------------------------------------------------------------
-- Routines
--------------------------------------------------------------------------------
-- Event-handlers
--------------------------------------------------------------------------------
function b_onClick()
    pdialog c = ColorDlg()
    setAttribute(c, "TITLE", "Colour Dialog")
    popup(c)
    Message("Colour choice", getAttribute(c, "VALUE"))
    return CONTINUE
end function
--------------------------------------------------------------------------------
function b2_onClick()
    return CLOSE
end function
--------------------------------------------------------------------------------
function b3_onClick()
    if equal(getAttribute(l, "VISIBLE"), "YES") then hide(l)
    else setAttribute(l, "VISIBLE", "YES")
    end if
    return CONTINUE
end function
--------------------------------------------------------------------------------
function b4_onClick()
    error(d, "I am an error")
    return CONTINUE
end function
--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
procedure main()
    Open(IUP)
        control b = Button("Open a modal colour dialog window")
        setCallback(b, "ACTION", Icallback("b_onClick"))
        control b2 = Button("Close the window here")
        setCallback(b2, "ACTION", Icallback("b2_onClick"))
        container h = Hbox({b, b2})
        setAttribute(h, "GAP", "20")
        l = Label("I am a label")
        control b3 = Button("I toggle-hide the label")
        setCallback(b3, "ACTION", Icallback("b3_onClick"))
        control b4 = Button("Test error message")
        setCallback(b4, "ACTION", Icallback("b4_onClick"))
        control t = IHandle(Text(), "VALUE=\"I am a multi-line text box\",EXPAND=YES,MULTILINE=YES")
        control t1 = Toggle("I am a checkbox/toggle")
        setAttribute(t1, "VALUE", "ON")
        container f = Frame(Vbox({t, t1, Hbox({l, b3, b4})}))
        setAttribute(f, "TITLE", "I am a frame")
        container v = Vbox({h, Fill(), f})
        setAttribute(v, "GAP", "50")
        d = IHandle(Dialog(v), "TITLE=\"This is my caption\",SIZE=THIRDxHALF")
        Message("The dialog's size", getAttribute(d, "SIZE"))
        Message("IUP Version Number", Version())
        show(d, 10, 100)
    Loop(IUP)
    Close(IUP)
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main()
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
