-- persons.ex

include oe4oop.e -- for base
oop:init()

include person.e -- for class
person me = Person("Dr","Charles Arthur Newbould",{1943,5,16})
Hello(me)

dob dummy = Dob({2000,1,3}) -- to ensure map working OK

person Fred = Person("Mr","Fred Brian Smith",{1965,12,25})
Hello(Fred)
ChangeName(Fred, "Frederick Bryan Smythe")
Promote(Fred, "Sir")
Hello(Fred)
