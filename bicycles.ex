--------------------------------------------------------------------------------
-- OE4OOP/map/bicycle.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
-- Test example for the 'bicycle' class
--
--Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.07
--Status: complete; operational
--Changes:]]]
-- * moved from //MarkII//
-- * modified accordingly
--------------------------------------------------------------------------------
-- Define some examples
--------------------------------------------------------------------------------
include bicycle.e
bicycle bike = Bicycle("hybrid")
        , bike2 = Bicycle(,24)
--------------------------------------------------------------------------------
-- Print some results
--------------------------------------------------------------------------------
printf(1, "My bicycle is a %s and so has %d gears.\n",
            {getPropulsion(bike), get(bike,"#gears")})
printf(1, "My second bicycle is a %s bike with %d gears.\n",
            {getPropulsion(bike2), get(bike2,"#gears")})
--------------------------------------------------------------------------------
-- Previous Versions
--------------------------------------------------------------------------------
--Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.07
--Status: complete; operational
--Changes:]]]
-- * extracted from //bicycle.e//
--------------------------------------------------------------------------------
