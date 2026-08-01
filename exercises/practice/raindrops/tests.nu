use raindrops.nu convert
use std/assert

# the sound for 1 is 1
assert equal (convert 1) "1"
# the sound for 3 is Pling
assert equal (convert 3) "Pling"
# the sound for 5 is Plang
assert equal (convert 5) "Plang"
# the sound for 7 is Plong
assert equal (convert 7) "Plong"
# the sound for 6 is Pling as it has a factor 3
assert equal (convert 6) "Pling"
# 2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base
assert equal (convert 8) "8"
# the sound for 9 is Pling as it has a factor 3
assert equal (convert 9) "Pling"
# the sound for 10 is Plang as it has a factor 5
assert equal (convert 10) "Plang"
# the sound for 14 is Plong as it has a factor of 7
assert equal (convert 14) "Plong"
# the sound for 15 is PlingPlang as it has factors 3 and 5
assert equal (convert 15) "PlingPlang"
# the sound for 21 is PlingPlong as it has factors 3 and 7
assert equal (convert 21) "PlingPlong"
# the sound for 25 is Plang as it has a factor 5
assert equal (convert 25) "Plang"
# the sound for 27 is Pling as it has a factor 3
assert equal (convert 27) "Pling"
# the sound for 35 is PlangPlong as it has factors 5 and 7
assert equal (convert 35) "PlangPlong"
# the sound for 49 is Plong as it has a factor 7
assert equal (convert 49) "Plong"
# the sound for 52 is 52
assert equal (convert 52) "52"
# the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7
assert equal (convert 105) "PlingPlangPlong"
# the sound for 3125 is Plang as it has a factor 5
assert equal (convert 3125) "Plang"
