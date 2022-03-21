-- cow.e

-- A child of the 'yielder' class

-- The definition of the 'cow' class:
--class cow(yielder)
    public include yielder.e -- for inheritance -'yielder', 'Yielder'
    export type cow(object o) -- t(o -> t(y->t(an->t(m)))) -> cow
        return yielder(o) -- 'yielder' is the parent
        end type
    -- four properties inherited from 'yielder'
    export function Cow(integer legs=4,sequence sound="Moo",integer times=1) -- f(f(i->s->i))->cow
        return Yielder(legs,sound,times)
        end function
    -- 'says' method inherited from 'animal'
    -- additional method: milk - accumulates the yield
    export function milk(cow c, atom y) -- f(c->a)->a
        return yield(c,y)
        end function
--end class
