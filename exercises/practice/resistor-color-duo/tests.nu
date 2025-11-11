use resistor-color-duo.nu value
use std/assert
assert equal (value [brown black]) 10
assert equal (value [blue grey]) 68    
assert equal (value [yellow violet]) 47
assert equal (value [orange orange]) 33
assert equal (value [green brown orange]) 51
assert equal (value [black brown]) 1
