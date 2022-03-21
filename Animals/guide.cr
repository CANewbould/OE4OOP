!!Version 1.0.11 2022.03.16
!!Version 1.0.10 2022.01.13

=A guide to using OE4OOP

by Charles A Newbould

(with special thanks to Alex(ander) Caracatsanis, whose splendid introduction to programming with Diamond Lite is the inspiration for this guide)

This is a (gentle - I hope) introduction to using Object-Oriented Programming (OOP) built upon Open Euphoria. All the examples and illustrations should work with any version, but have been developed and tested using  Version 4.1.0b2 (the latest one available for download).

I will assume that you the reader are already familiar with the Euphoria language, but will begin with some basic OOP concepts, which I shall not assume.

==OOP

OOP is essentially a "black box" view of programming.

All programming languages deal with //data// and //routines// (the things that allow data to be transformed and manipulated). In conventional approaches these notions are essentially kept separate, with routines being constructed in much the same way as algebraic formulae, and data being defined and classified into a range of types (hierarchical or otherwise). The interaction comes when a routine's definition requires the writer to specify any restrictions on the data used in that definition or accepted as "input" (//arguments//) to it.

Where OOP stands out is that the two concepts are essentially merged, but with //data// assuming  dominance. Instead of data being fed into routines and other data (possibly) resulting, in OOP all data are manipulated from within an //Object//, this being a receptacle both for (sub) items of data ##and## all the routines which can be used to modify the contents of the Object. No processing outside the Object can take place, nor can an "outsider" access the inner contents of that Object, except using the tools provided by the coder of that Object.

Objects, often referred to as //Instance//s or //Entities//, are defined using a general typography, known as //Class// definition. Every Instance is a living example of the Object defined in the class statement, but unique insofar as it has been the subject of initialisation and subsequent manipulation by a user.

To aid generalisation, a class which is a refinement of a pre-existing class can //inherit// all the //properties// (internal data items) and //method//s (routines) resident in the parent class definition. So code written once can be used (potentially) over and over again; or, more particularly, you don't (necessarily) have to start creating new classes from scratch.

Although arguably not an essential part of the OOP concept, it is thought desirable to have maximum flexibility by having methods which have multiplicity of purpose and/or form, so that they can handle a wider range of circumstances and/or can be easily extended to cover new developments. This applies particularly when instances are created. A new instances is created using a //Constructor// routine (a **function** returning a value - here a pointer to the specific object/instance). Having the capacity to accept a range of different input values obviously generalises and thus greatly enhances the utility of the Constructor. For example, using a Euphorian concept, we might want to create a **sequence** directly from a specific value, or using the ##repeat## function, creating a ##series##, etc.

Another issue which enhances the principle of code re-use is the ability of a "child" class to overwrite the definition of one particular method without disturbing the rest of the inherited set of methods - a process known as //overriding//.

==Euphoria's approach to these concepts

Euphoria has always made claims to possessing many of the ideas of OOP without offering, within the language, any set system or obvious syntax to implement them.

The original (RDS) Euphoria always had some OOP-friendly notions and Open Euphoria's development has added quite a few others. Current discussion on the Forum with regard to "Structs" suggests that more might follow. Let's take a quick look at these.

Euphoria (remember the "ho" stands for "hierarchy" and "objects", respectively) offers a **type** concept, whereby a data "structure" can be precisely defined/restricted. Using a **sequence** as a "shell" enables a user to build any kind of type that one could possibly imagine.

Within a sequence it is possible to store individual items of data, each having its own type definition. The concept of **routine_id** (whereby any function or procedure can be represented by an integral value) allows a sequence also to hold - via this pointer - (indirectly to) routines.

Equally a data-structure, like a **sequence** or a **map** (a **dictionary** in other languages) can be stored away from a user's access but pointed to using a **handle**; this is the approach used by OE4OOP which will be exemplified below.

Thus Euphoria has always enabled OOP's concept of //encapsulation//.

Likewise Euphoria has always offered tools for managing //scope//: the ability to determine what data/routines are accessible in different programming environments. Open Euphoria has refined these, to allow more sophisticated scope management, both between modules of code and within the structures inside blocks of code. So Euphoria has always been capable of showing and hiding what is available for users to access.

Open Euphoria also introduced the formal process of **override** (but it was always - warning aside - there before). The concept of **namespace** (explicit in Open Euphoria, but available before) offers the ability to re-use the same routine names in different modules. The big OOP-related advance, however, was the ability to set default values to a routine's arguments, thus allowing different numbers and/or types of arguments to be offered. (Incidentally, the option was always there before - by using sequence(s) as arguments - see, for example, Matt Lewis's approach to argument-setting in his wxEuphoria library.)

Although less well exemplified in the Euphoria literature, overriding has always been possible using ##routine_id##s. The //shapes// example in the repository shows precisely how this can be done. In fact, all-in-all, I believe it to be better than the formal //override// or the namespace approach.

So, for reasons like these, I believe the claims have always been justified.

==OE4OOP explained

Let's make a visit to Chestnut Farm, where Farmer Giles lives with his wife. The farm is small and mixed: there are milking cows in the fields, sheep on the moor and pigs behind the farm. Mrs Giles has a hen run, for the eggs produced. Farmer Giles has two dogs - one a worker, the other its predecessor, now an elderly pet. Two cats keep the mice down in the barn and keep the house vermin-free. Sadly one now isn't really a rat-catcher any more because it lost a leg in a road accident. How do we turn this nice pastoral scene into a set of objects?

Start with the class hierarchy: here everything is animal. So we start with a class, with name **animal**, which has no parents. We call this a Base Class. We (using comment where needed) list the property types and values, which enter the constructor (the naming convention is the title-case of the class name) to initialise it with defaults. (Note, too, that type-checking takes place at this point.) Further comment-based annotation aids the description of the OE4OOP system.

<eucode>--class animal() - no formal syntax, so use comment for layout
    public include map.e -- for the 'engine': 'new', 'put', 'get'
    export type animal(object o)
        return map(o) -- base class so 'map' is the parent
        end type
    --  property integer legs - the number of legs an animal has
    --  property string sound - the sound an animal makes
    --  property integer times - the number of repeated sounds
    include string.e -- for 'string'
    -- The Base Class Constructor - Title-case usage
    public function Animal(integer legs=0,string sound="",integer times=1) -- returns an 'animal' instance
        animal a = map:new() -- an empty store
        -- add the property name as 'key'; value as 'data'
        map:put(a,"legs",legs)
        map:put(a,"sound",sound)
        map:put(a,"times",times)
        return a -- the handle to the map structure
        end function
    --  'says' method: returns the sound (string) of an 'animal' object
    public function says(animal a,integer i=map:get(a,"times")) -- returns the [repeated] sound
        string s = get(a,"sound")
        switch i do
        case 0 then return ""
        case 1 then return s
        case else return says(a,i-1) & ',' & s
        end switch
        end function
--end class - no formal syntax, so use comment for layout</eucode>

We need to think about the nature of the farm animals and what each is there for. Hens and Cows are productive - eggs and milk, respectively - whereas the others are either workers, pets or only produce a "product" when taken to the market or to the abattoir.

So we need an extra "working" class, to sit between **animal**, on the one hand, and **hen** and **cow**, on the other; I call this a **yielder**. The definition is:

<eucode>--class yielder(animal)
    export type yielder(object o)
        return animal(o) -- 'animal' is the parent
        end type
    -- three properties inherited from 'animal'
    -- additionally: atom yield = 0 - initialised, but used as an accumulator
    include string.e -- for 'string'
    export function Yielder(integer legs=0,string sound="",integer times=1) -- returns a 'yielder' instance
        yielder y = Animal(legs,sound,times)
        map:put(y,"yield",0) -- add and initialise the new property
        return y
        end function
    -- additional method: yield - accumulates the yield
    export function yield(yielder y, atom z) -- managed accumulator - returns aggregate for reporting
        atom tot = map:get(y,"yield") + z
        map:put(y,"yield",tot)
        return tot
    end function
--end class</eucode>

We can then add class definitions for each of the animals on the farm. For the yielders:

<eucode>--class cow(yielder)
    export type cow(object o)
        return yielder(o) -- 'yielder' is the parent
        end type
    -- four properties inherited from 'yielder'
    include string.e -- for 'string'
    public function Cow(integer legs=4,string sound="Moo",integer times=1) -- returns a 'cow' instance
        return Yielder(legs,sound,times)
        end function
    -- 'says' method inherited from 'animal'
    -- additional method: milk - context-based alias for 'yield'
    export function milk(cow c, atom y) -- managed accumulator - returns aggregate for reporting
        return yield(c,y)
        end function
--end class</eucode>

<eucode>--class hen(yielder)
    export type hen(object o)
        return yielder(o) -- 'yielder' is the parent
        end type
    -- four properties inherited from 'yielder'
    include string.e -- for 'string'
    public function Hen(integer legs=2,string sound="Cluck",integer times=2) -- returns 'hen' instance
        return Yielder(legs,sound,times)
        end function
    -- 'says' method inherited from 'animal'
    -- additional method: eggs - context-based alias for 'yield'
    export function eggs(hen h, atom y) -- managed accumulator - returns aggregate for reporting
        return yield(h,y)
        end function
--end class</eucode>

The others inherit directly from 'animal', so they resemble each other:

<eucode>--class sheep(animal)
    export type sheep(object o)
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    include string.e -- for 'string'
    public function Sheep(integer legs=4,string sound="Baa",integer times=1) -- return 'sheep' instance
        return Animal(legs,sound,times)
        end function
--end class</eucode>

<eucode>--class pig(animal)
    export type pig(object o)
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    include string.e -- for 'string'
    public function Pig(integer legs=4,string sound="Grunt",integer times=2)  -- return 'pig' instance
        return Animal(legs,sound,times)
        end function
--end class</eucode>

<eucode>--class dog(animal)
    export type dog(object o)
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    include string.e -- for 'string'
    public function Dog(integer legs=4,string sound="Woof",integer times=1)  -- return 'dog' instance
        return Animal(legs,sound,times)
        end function
--end class</eucode>

<eucode>--class cat(animal)
    export type cat(object o)
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    include string.e -- for 'string'
    public function Cat(integer legs=4,string sound="Miaew",integer times=1) -- return 'cat' instance
        return Animal(legs,sound,times)
        end function
--end class</eucode>

Note that all of the specific animal (types) inherit the properties of all animals.

Different animals can be distinguished by the sound each makes and the number of times the sound is typically uttered.

Having a small farm and being very animal-conscious, the Giles have (pet) names for all their stock.

Let's now take a look at how we create an instance. Try Daisy the Cow, who has no special features, whereas Frieda, the other cow is quite noisy, so:

<eucode>-- chestnut.ex
include cow.e
cow Daisy = Cow() -- no special features
cow Frieda = Cow(,,2)

include io.e
writefln(says(Daisy),"Daisy says %s")
writefln(says(Frieda),"Frieda says %s")

milk(Daisy,30)
milk(Daisy,25)
writefln(milk(Daisy, 20), "Daisy's yield is %d gallons.")</eucode>

which results in:
%%style=terminal
%(Daisy says Moo\\
Frieda says Moo,Moo\\
Daisy's yield is 75 gallons.)%

We can do similar things with all the other animals, but before giving the final test data, note that the humans running the farm are also animals!

We can modify our previous definition of a **person** as follows:

<eucode>--class person(animal)
    export type person(object o)
        return animal(o) -- the 'parent'
        end type
    -- three properties inherited from 'animal'
    include string.e -- for 'string'
    -- additionally: string title
    public include name.e -- for inheritance
    -- additionally: name name
    public include dob.e -- for inheritance
    -- additionally: dob dob
    public function Person(string title, string names, sequence birthday, integer legs=2,string sound="",integer times=1) -- return 'person' instance
        person p = Animal(legs,sound,times)
        put(p, "title", title)
        put(p, "name", Name(names))
        put(p, "dob", Dob(birthday))
        return p
        end function
    constant VOID = 0
    public function changeName(person p, string n)
        put(p,"name",Name(n))
        return VOID
    end function
    public enum ASPTR=0,ASSTRING,INFULL
    public function getName(person p, integer asstr = ASPTR)
        switch asstr do
        case ASSTRING then return Dear(get(p,"name"))
        case INFULL then return getTitle(p) & ' ' & Dear(get(p,"name"))
        case else return get(p,"name")
        end switch
    end function
    public function getDob(person p, integer asstr = ASPTR)
        if asstr then return Display(get(p,"dob"),":", 1)
        else return get(p,"dob")
        end if
    end function
    public function getTitle(person p)
        return get(p,"title")
    end function
    public function promote(person p, string t)
        put(p,"title", t)
        return VOID
    end function
--end class</eucode>

and add them to the general farm identification.

Here is an example of reviewing **animal**s on Chestnut Farm:

<eucode>-- chestnut.ex

-- example of classes derived from 'animal'
-- using Chestnut Farm as its context

include cow.e
cow Daisy = Cow() -- no special features
cow Frieda = Cow(,,2)

include io.e
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
writefln(says(Mary),"and says %s.")</eucode>

You might need to edit //eu.cfg// if you have moved stuff around but you should get the following output:

%%style=terminal
%(Daisy says Moo\\
Frieda says Moo,Moo\\
Daisy's yield is 75 gallons.\\
Matilda says Cluck,Cluck\\
Matilda's yield is 10 eggs.\\
Rufus says Miaew\\
Finn says Miaew,Miaew\\
Nigel says Grunt,Grunt\\
Boris says Woffle,Woffle,Woffle,Woffle\\
Fido says Woof\\
Lucinda says Woof,Woof\\
Napoleon says Baa\\
Josephine says Baa,Baa,Baa\\
Giles says Well,Well\\
Farmer William Giles is 60 years old.\\
Mrs Mary Giles is 58 years old, and says Oh,dear.)%

I hope that you have followed this detailed example, noted the style I have adopted for defining classes, and understand the power of such a simple rendering of Euphoria to produce a "tight" version of OOP.

Enjoy!!
