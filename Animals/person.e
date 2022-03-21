-- person.e

-- A child of 'animal', representing a few aspects of a human being

-- The definition of the 'person' class:
--class person(animal)
    public include animal.e -- for inheritance
    export type person(object o) -- t(o->t(an->t(m))) -> p
        return animal(o) -- the 'parent'
        end type
    -- three properties inherited from 'animal'
    public include name.e -- for inheritance
    -- additionally: name name
    public include dob.e -- for inheritance
    -- additionally: dob dob
    public function Person(sequence title, sequence names, sequence birthday, integer legs=2,sequence sound="",integer times=1) -- f(f(s->s->s->i->s->i))->p
        person p = Animal(legs,sound,times)
        put(p, "title", title)
        put(p, "name", Name(names))
        put(p, "dob", Dob(birthday))
        return p
        end function
    constant VOID = 0
    public function changeName(person p, sequence n) -- f(p -> [c]) -> v
        put(p,"name",Name(n))
        return VOID
    end function
    public enum ASPTR=0,ASSTRING,INFULL
    public function getName(person p, integer asstr = ASPTR) -- f(p -> i) -> n|[c]
        switch asstr do
        case ASSTRING then return Dear(get(p,"name"))
        case INFULL then return getTitle(p) & ' ' & Dear(get(p,"name"))   
        case else return get(p,"name")
        end switch
    end function
    public function getDob(person p, integer asstr = ASPTR) -- f(p -> i) -> dob|[c]
        if asstr then return Display(get(p,"dob"),":", 1)
        else return get(p,"dob")
        end if
    end function
    public function getTitle(person p) -- f(p) -> [c]
        return get(p,"title")
    end function
    public function promote(person p, sequence t) -- f(p -> [c]) -> v
        put(p,"title", t)
        return VOID
    end function
--end class
