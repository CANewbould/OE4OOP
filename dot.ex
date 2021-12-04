--------------------------------------------------------------------------------
-- dot.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Application: dot.ex
-- Description: a basic pre-processor for OE4OOP.
------
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.11.26
--Status: incomplete; operational
--Changes:]]]
--* added test for extension
--* added prompt if source file not specified
--
--==Open Euphoria for OOP application: dot
--
-- Code the desired application in dot notation, using:
--
-- <instance>.<method>
--
-- syntax.
--
-- Confine your method calls to one-per-line.
-- When keyed, file the code (I recommend using the OE convention for
-- the extension but prefixed by a 'd', so 'dex' or 'dexw').
--
-- Run this application by keying:
-- <eucode>eui dot[.ex] <nameofsourcefile[.dex[w]]></eucode>
--
-- The default action is:
-- <eucode>eui dot <nameofsourcefile></eucode>
--
-- as the pre-processor assumes an extension of //dex//.
--
-- A file //dottemp.ex// is created, being the converted OE4OOP code.
-- This is then executed in OE as normal.
--
-- The pre-processor issues two information lines to the console before
-- issuing the output.
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
include std/console.e -- for any_key, prompt_string
include std/search.e -- for begins
include std/sequence.e -- for reverse
include std/utils.e -- for iif
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant CB = ')'
constant COMMA = ", "
constant DOT = '.'
constant EMPTY_SEQUENCE = ""
constant OB = '('
constant QUOTE = '"'
constant SPACE = ' '
constant TRUE = not 0
--------------------------------------------------------------------------------
--
-- Types
--
--------------------------------------------------------------------------------
type filehandle(integer this)
    return this = -1 or this > 2
end type
--------------------------------------------------------------------------------
--
--=== Variables
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
function transpose(sequence line)
    -- need exclusions
    if match("include", line) then return line end if
    if begins("--", line) then return line end if
    integer dot = find(DOT, line)
    --if find, ('"', line) < dot then return line end if
    if dot
    then
        integer openquote = find(QUOTE, line, 1) -- v4.1.0.1
        integer closequote = find(QUOTE, line, dot) -- v4.1.0.1
        if openquote < dot and closequote then return line end if -- v4.1.0.1
        integer openbracket = find(OB, line, dot)
        integer closebracket = find(CB, line, dot)
        sequence fn = line[dot+1..openbracket-1]
        integer previousspace = find( SPACE, reverse(line[1..dot]))
        if previousspace
        then previousspace = dot - previousspace + 1
        else previousspace = 0
        end if
        sequence obj = line[previousspace+1..dot-1]
        return line[1..previousspace] & fn & OB & obj
                    & iif(closebracket > openbracket+1, COMMA, "")
                    & line[openbracket+1..$]
    else return line -- no dot
    end if
end function
--------------------------------------------------------------------------------
procedure unopened(sequence this)
    any_key("The file: " & this & " cannot be opened"
                & "Aborting when you key ENTER", 2)
    abort(0)
end procedure
--------------------------------------------------------------------------------
procedure main()
    sequence commline = command_line()
    if length(commline) < 3
    then commline = append(commline, prompt_string("File to be processed: "))
    else --OK
    end if
    if find('.', commline[3])
    then --OK
    else commline[3] &= ".dex"
    end if
    -- insert test for length and prompt if short
    filehandle ih = open(commline[3], "r") -- v4.0.5.2
    if ih
    then --OK
    else unopened(commline[3])
    end if
    sequence output = EMPTY_SEQUENCE
    while TRUE do
        object line = gets(ih)
        if atom(line)
        then exit -- END_OF_STREAM
        else line = transpose(line) --do transformation
        end if
        output &= line
    end while
    close(ih)
    filehandle oh = open("dottemp.ex", "w")
    if ih
    then puts(oh, output)--OK
    else unopened("dottemp.ex")
    end if
    close(oh)
    puts(1, "!!! Using OE4OOP's DOT notation pre-processor !!!\n\n")
    puts(1, "*** Processed output follows (OE code in 'dottemp.ex') ***\n\n")
    system("eui dottemp.ex", 0)
end procedure
--------------------------------------------------------------------------------
--
--=== Execution
--
--------------------------------------------------------------------------------
main()
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.30
--Status: incomplete; operational
--Changes:]]]
--* extended decumentation
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.10.27
--Status: incomplete; operational
--Changes:]]]
--* copied from OCE version
--* modified code to use std libraries
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.09.14
--Status: incomplete; operational
--Changes:]]]
--* incorporated test for dot embedded in quotes
--------------------------------------------------------------------------------
--[[[Version: 4.1.0.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2021.08.16
--Status: incomplete; operational
--Changes:]]]
--* created
--------------------------------------------------------------------------------
