-- dog.e

-- A child of 'animal'

-- The definition of the 'dog' class:
--class dog(animal)
    public include animal.e -- for inheritance
    export type dog(object o) -- t(o ->t(an->t(m))) -> dog
        return animal(o) -- 'animal' is the parent
        end type
    -- properties inherited from 'animal'
    public function Dog(integer legs=4,sequence sound="Woof",integer times=1) -- f(f(i->s->i))->dog
        return Animal(legs,sound,times)
        end function
--end class
