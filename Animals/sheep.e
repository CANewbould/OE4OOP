-- sheep.e

-- A child of 'animal'

-- The definition of the 'sheep' class:
--class sheep(animal)
    public include animal.e -- for inheritance
    export type sheep(object o) -- t(o -> t(an)) -> sh
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    public function Sheep(integer legs=4,sequence sound="Baa",integer times=1) -- f(f(i->s->i))->sheep
        return Animal(legs,sound,times)
        end function
--end class
