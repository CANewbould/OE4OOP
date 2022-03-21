-- hen.e

-- A child of the 'yielder' class

-- The definition of the 'hen' class:
--class hen(yielder)
    public include yielder.e -- for inheritance -'yielder', 'Yielder'
    export type hen(object o) -- t(o->t(y->t(an->t(m)))) -> hen
        return yielder(o) -- 'yielder' is the parent
        end type
    -- properties inherited from 'yielder'
    public function Hen(integer legs=2,sequence sound="Cluck",integer times=2) -- f(f(i->s->i))->hen
        return Yielder(legs,sound,times)
        end function
    -- 'says' method inherited from 'animal'
    -- additional method: eggs - accumulates the yield
    export function eggs(hen h, atom y) -- f(c->a)->a
        return yield(h,y)
        end function
--end class
