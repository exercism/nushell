use acronym.nu abbreviate
use std/assert
assert equal (abbreviate "Portable Network Graphics") "PNG"
assert equal (abbreviate "Ruby on Rails") "ROR"
assert equal (abbreviate "First In, First Out") "FIFO"
assert equal (abbreviate "GNU Image Manipulation Program") "GIMP"
assert equal (abbreviate "Complementary metal-oxide semiconductor") "CMOS"
assert equal (abbreviate "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me") "ROTFLSHTMDCOALM"
assert equal (abbreviate "Something - I made up from thin air") "SIMUFTA"
assert equal (abbreviate "Halley's Comet") "HC"
assert equal (abbreviate "The Road _Not_ Taken") "TRNT"
