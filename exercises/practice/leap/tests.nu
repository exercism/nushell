use leap.nu leapYear
use std/assert

assert not (leapYear 2015)
assert not (leapYear 1970)
assert (leapYear 1996)
assert (leapYear 1960)
assert not (leapYear 2100)
assert not (leapYear 1900)
assert (leapYear 2000)
assert (leapYear 2400)
assert not (leapYear 1800)
