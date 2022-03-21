-- yielder.e

-- A child of 'animal', domesticated for its yielding property

-- The definition of the 'yielder' class:
--class yielder(animal)
    public include animal.e -- for inheritance
    export type yielder(object o) -- t(o -> m(an)) -> y
        return animal(o) -- 'animal' is the parent
        end type
    -- three properties inherited from 'animal'
    -- additionally: atom yield = 0
    export function Yielder(integer legs=0,sequence sound="",integer times=1) -- f(i->s->i)->y
        yielder y = Animal(legs,sound,times)
        map:put(y,"yield",0) -- add and initialise the new property
        return y
        end function
    -- additional method: yield - accumulates the yield
    export function yield(yielder y, atom z) -- f(y->a)->a
        atom tot = map:get(y,"yield") + z
        map:put(y,"yield",tot)
        return tot
    end function
--end class
