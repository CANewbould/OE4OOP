-- file.ex

--Version 4.0.5.1
--Date: 2021.12.16
--Author: C A Newbould
--Status: complete; operational
--Changes:
--* changed file to be read
--* changed Line 22(now) to remove reference to string type's method

include file.e

oop:init() -- to initialise the Objects map store

file f = File("../circle.e") -- Version 4.0.5.1
Open(f)
sequence state
if IsOpen(f) then state = "now open"
else state = "closed"
end if
printf(1, "%s is %s, with handle = %d\n", {GetName(f), state, GetHandle(f)})
printf(1, "The first 20 characters of the file: %s\n", {Read(f, 20)}) -- Version 4.0.5.1
Seek(f) -- start
Seek(f,, EOS) -- eof
printf(1, "%s is %d characters long\n", {GetName(f), Tell(f)})
Seek(f,-100, CURRENT)
printf(1, "Pointer now at %d\n", {Tell(f)})
Close(f)
if IsOpen(f) then puts(1, "File still open!\n") else puts(1, "File now closed!\n") end if
