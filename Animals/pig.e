-- pig.e

-- A child of 'animal'

-- The definition of the 'pig' class:
--class pig(animal)
    public include animal.e -- for inheritance
    export type pig(object o) -- t(o -> m(an)) -> pig
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    public function Pig(integer legs=4,sequence sound="Grunt",integer times=2) -- f(f(i->s->i))->pig
        return Animal(legs,sound,times)
        end function
--end class
