-- cat.e

-- A child of 'animal'

-- The definition of the 'cat' class:
--class cat(animal)
    public include animal.e -- for inheritance
    export type cat(object o) -- t(o->t(an->t(m))) -> cat
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    public function Cat(integer legs=4,sequence sound="Miaew",integer times=1) -- f(f(i->s->i))->cat
        return Animal(legs,sound,times)
        end function
--end class
