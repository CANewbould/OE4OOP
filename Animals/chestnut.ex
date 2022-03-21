-- chestnut.ex

-- example of classes derived from 'animal'
-- using Chestnut Farm as its context

include cow.e
cow Daisy = Cow() -- no special features
cow Frieda = Cow(,,2)

include io.e -- for 'display','writefln'
writefln(says(Daisy),"Daisy says %s")
writefln(says(Frieda),"Frieda says %s")

milk(Daisy,30)
milk(Daisy,25)
writefln(milk(Daisy, 20), "Daisy's yield is %d gallons.")

include hen.e
hen Matilda = Hen()
writefln(says(Matilda),"Matilda says %s")
eggs(Matilda,6)
writefln(eggs(Matilda, 4), "Matilda's yield is %d eggs.")

include cat.e
cat Rufus = Cat()
writefln(says(Rufus),"Rufus says %s")
cat Finn = Cat(3,,2)
writefln(says(Finn),"Finn says %s")

include pig.e
pig Nigel = Pig()
writefln(says(Nigel),"Nigel says %s")
pig Boris = Pig(,"Woffle",4)
writefln(says(Boris),"Boris says %s")

include dog.e
dog Fido = Dog()
writefln(says(Fido),"Fido says %s")
dog Lucinda = Dog(,,2)
writefln(says(Lucinda),"Lucinda says %s")

include sheep.e
sheep Napoleon = Sheep()
writefln(says(Napoleon),"Napoleon says %s")
sheep Josephine = Sheep(,,3)
writefln(says(Josephine),"Josephine says %s")

include person.e
person Giles = Person("Farmer","William Giles",{1961,2,28},,"Well",2)
writefln(says(Giles),"Giles says %s")
writef(getName(Giles,INFULL),"%s")
writefln(Age(getDob(Giles))," is %d years old.")
person Mary = Person("Mrs","Mary Louisa Giles",{1963,11,4},,"Oh,dear")
writef(getName(Mary,INFULL),"%s")
writef(Age(getDob(Mary))," is %d years old, ")
writefln(says(Mary),"and says %s.")

display("Chestnut Farm")
