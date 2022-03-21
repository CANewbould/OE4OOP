-- animal.e

-- The Base Class definition for all animals

-- All OE4OOP objects are 'map' objects

-- The definition of the 'animal' class:
--class animal()
    public include std/map.e -- for 'new', 'put', 'get'
    export type animal(object o) -- t(o -> t(m)) -> an
        return map(o) -- base class so 'map' is the parent
        end type
    -- property integer legs - the number of legs an animal has
    -- property string sound - the sound an animal makes
    -- property integer times - the number of repeated sounds
    -- The Base Class Constructor - Title-case usage
    public function Animal(integer legs=0,sequence sound="",integer times=1) -- f(i->s->i)->an
        animal a = map:new() -- an empty store
        -- add the property values
        map:put(a,"legs",legs)
        map:put(a,"sound",sound)
        map:put(a,"times",times)
        return a
        end function
    -- 'says' method: returns the sound string of an 'animal' object
    public function says(animal a,integer i=map:get(a,"times")) -- f(an) -> [c]
        sequence s = get(a,"sound")
        switch i do
        case 0 then return ""
        case 1 then return s
        case else return says(a,i-1) & ',' & s
        end switch
        end function
--end class
