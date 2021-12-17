--------------------------------------------------------------------------------
-- OE4OOP/MarkII/file.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: file.e
--Description: a simple file "class" using the OE4OOP approach
------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.16
--Status: complete, but extensible; operational
--Changes:]]]
--* edited out references to string as a class - now just a (standard) type
--
--==Open Euphoria for OOP (OE4OOP) library: file
--
-- This class has two properties:
--
-- * a **string** holding the name of the file
-- * an **integer** holding the handle to the file
--
-- and fifteen methods:
--
-- * ##File##(string[, string]) - the Constructor
-- * ##GetName##(file) - string: the stored filename
-- * ##GetHandle##(file) - integer: the current value (-1|>2) 
-- * ##Open##(file) - void
-- * ##Close##(file) - void
-- * ##IsOpen##(file) - boolean
-- * ##IsClosed##(file) - boolean
-- * ##Read##(file[,integer]) - string
-- * ##ReadLine##(file[,integer]) - string
-- * ##ReadLines##(file) - sequence
-- * ##Write##(file,sequence) - integer
-- * ##WriteLines##(file,sequence) - integer
-- * ##Flush##(file) - void
-- * ##Seek##(file[atom[,integer]]) - boolean
-- * ##Tell##(file) - integer
--
-- To invoke this library add:
-- <eucode>[public ]include file.e</eucode>
-- to the calling module.
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--=== Includes
--*/
--------------------------------------------------------------------------------
public include oe4oop.e -- for OE4OOP engine, 'inst', 'EMPTY', 'VOID' -- Version 4.0.5.1
include std/io.e
include std/math.e -- for 'abs'
include std/types.e -- for 'string' -- Version 4.0.5.1
--------------------------------------------------------------------------------
--/*
--=== "Class" file
--*/
--------------------------------------------------------------------------------
export type file(integer this) -- [pointer/index] positive integer
    return inst(this) -- inheritance - from Base Class
    end type
    enum NAME, HANDLE -- property pointers
    export function File(string name, string mode = EMPTY) --> [file] -- Version 4.0.5.1
        integer fh
        if length(mode)
        then fh = open(name, mode)
        else fh = -1
        end if
        return New({name, fh}) -- Version 4.0.5.1
        end function
    export function GetName(file this) -- [sequence]
        sequence f = getD(this)
        return f[NAME] -- Version 4.0.5.1
        end function
    export function GetHandle(file this) -- [integer]
        sequence f = getD(this)
        return f[HANDLE]
        end function
    export function IsOpen(file this) --> [boolean] open|closed
        return GetHandle(this) > 2
        end function
    export function IsClosed(file this) --> [boolean] closed|open
        return not IsOpen(this)
        end function
    export function Open(file this, string mode = "r") --> [void] -- Version 4.0.5.1
        sequence f = getD(this)
        f[HANDLE] = open(f[NAME], mode) -- Version 4.0.5.1
        setD(this, f)
        return VOID
        end function
    export function Read(file this, integer size = 0) --> [string] containing contents of file|size bytes
        if IsClosed(this) then Open(this) end if
        integer fh = GetHandle(this)
        string str = "" -- Version 4.0.5.1
        if size then
            for i = 1 to size do
                str &= getc(fh)
                end for
        else
            integer c = getc(fh)
            while c != EOF do
                str &= c
                c = getc(fh)
            end while
        end if
        return str -- Version 4.0.5.1
        end function
    export function ReadLine(file this, integer size = 0) --> [string] containing next line (size all|bytes)
        string line = gets(GetHandle(this)) -- Version 4.0.5.1
        if size = 0
        then return line -- Version 4.0.5.1
        else return line[1..size] -- Version 4.0.5.1
        end if
        end function
    export function ReadLines(file this) --> [sequence] set of lines
        return read_lines(GetHandle(this))
        end function
    export function Close(file this) --> [void]
        sequence f = getD(this)
        integer fh = f[HANDLE]
        if fh > 2 then
            close(fh)
            f[HANDLE] = -1
            setD(this, f)
        else -- OK
        end if
        return VOID
        end function    
    export function Flush(file this) --> [void]
        flush(GetHandle(this))
        return VOID
        end function    
    export enum START, CURRENT, EOS
    export function Seek(file this, atom offset = 0, integer whence = START) --> [boolean] success?
        integer fh = GetHandle(this)
        integer here = where(fh)
        switch whence do
        case START then offset = abs(offset)
        case CURRENT then offset += here
        case EOS then offset = -1
        end switch
        return seek(fh, offset)
        end function
    export function Tell(file this) --> [integer] current position in filestream
        return where(GetHandle(this))
        end function
    export function Write(file this, string data) --> [integer] 1 (success)|-1
        return write_file(GetHandle(this), data)
        end function
    export function WriteLines(file this, sequence lines) --> [integer] 1 (success)|-1
        return write_lines(GetHandle(this), lines)
        end function
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.12.15
--Status: complete, but extensible; operational
--Changes:]]]
--* created with 'string' as a class type
--------------------------------------------------------------------------------    
