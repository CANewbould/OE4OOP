--------------------------------------------------------------------------------
-- OE4OOP/file.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: file.e
--Description: a simple file "class" using the OE4OOP approach
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.27
--Status: complete, but extensible; operational
--Changes:]]]
--* created
--
--==Open Euphoria for OOP (OE4OOP) library: file
--
-- This library defines a //file// "class".
--
-- The library stores (locally) instances/entities and their current property values.
--
-- The process issues a handle whenever the Constructor is called, which
-- links to specific instance to the local store.
--
-- The stored instances/entities are at the level of abstraction determined in
-- the class definition.
--
-- Instance property values can only be accessed or changed if an 
-- appropriate //accessor// or //mutator// routine is defined and given appropriate
-- scope.
--
-- This file "class" has just two "properties":
--
--* name
--* handle
--
-- To invoke this library add:
-- <eucode>include file.e</eucode>
-- to the calling module (library or application), possible in the form:
-- <eucode>public include file.e</eucode>
-- if using for purposes of inheritance.
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes only standard OE libraries
--*/
--------------------------------------------------------------------------------
include std/io.e -- for 'flush', 'seek', 'where'
include std/math.e -- for 'abs'
include std/types.e -- for 'boolean', 'string'
--------------------------------------------------------------------------------
--/*
--=== "class" file
--*/
--------------------------------------------------------------------------------
export type file(integer this) -- [pointer/index] positive integer
    return this > 0
    end type
    sequence files = {} -- for storage of instance/entity sub-sequences
    integer fl = 0 -- index to 'persons' storage and, when assigned, the
                          -- ID pointer identifying the instance/entity
    enum NAME, HANDLE -- pointers to properties
    export function File(string name, string mode = "") --> [file]
        integer fh
        if length(mode)
        then fh = open(name, mode)
        else fh = -1
        end if
        files = append(files, {name, fh})
        fl += 1
        return fl
        end function
    export function getName(file this) --> [string] file name
        return files[this][NAME]
        end function
    export function getHandle(file this) --> [integer] current file handle
        return files[this][HANDLE]
        end function
    export function isOpen(file this) --> [boolean] open|closed
        return files[this][HANDLE] > 2
        end function
    export function closed(file this) --> [boolean] closed|open
        return not isOpen(this)
        end function
        export procedure Open(file this, string mode = "r")
        files[this][HANDLE] = open(files[this][NAME], mode)
        end procedure
    export function read(file this, integer size = 0) --> [string] contents of file|size bytes
        if closed(this) then Open(this) end if
        integer fh = files[this][HANDLE]
        string str = ""
        if size
        then
            for i = 1 to size
            do
                str &= getc(fh)
            end for
        else
            integer c = getc(fh)
            while c != EOF
            do
                str &= c
                c = getc(fh)
            end while
        end if
        return str
        end function
    export function readline(file this, integer size = 0) --> [string] next line (size bytes
        string line = gets(files[this][HANDLE])
        if size = 0
        then return line
        else return line[1..size]
        end if
        end function
    export function readlines(file this) --> [sequence] set of lines
        return read_lines(files[this][HANDLE])
        end function
    export procedure Close(file this)
        if files[this][HANDLE] > 2
        then close(files[this][HANDLE])
        else -- OK
        end if
        files[this][HANDLE] = -1
        end procedure
    export procedure Flush(file this)
        flush(files[this][HANDLE])
        end procedure
    export enum START, CURRENT, EOS
    export function Seek(file this, atom offset = 0, integer whence = START) --> [boolean] success?
        integer fh = files[this][HANDLE]
        integer here = where(fh)
        switch whence do
        case START then offset = abs(offset)
        case CURRENT then offset += here
        case EOS then offset = -1
        end switch
        return seek(fh, offset)
        end function
    export function Tell(file this) --> [integer] current position in filestream
        return where(files[this][HANDLE])
        end function
    export function write(file this, string data) --> [integer] 1 (success)|-1
        return write_file(files[this][HANDLE], data)
        end function
    export function writelines(file this, sequence lines) --> [integer] 1 (success)|-1
        return write_lines(files[this][HANDLE], lines)
        end function
    --------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- test
file f = File("file.e")
Open(f)
if isOpen(f) then printf(1, "%s is now open, with handle = %d\n", {getName(f), getHandle(f)}) end if
printf(1, "The first 20 characters of the file: %s\n", {read(f, 20)})
Seek(f) -- start
Seek(f,, EOS) -- eof
printf(1, "%s is %d characters long\n", {getName(f), Tell(f)})
Seek(f,-100, CURRENT)
printf(1, "Pointer now at %d\n", {Tell(f)})
Close(f)
if isOpen(f) then puts(1, "File still open!\n") else puts(1, "File now closed!\n") end if
