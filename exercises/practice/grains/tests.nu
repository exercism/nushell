use grains.nu [square total]
use std/assert

# grains on square 1
assert equal (square 1) 1
# grains on square 2
assert equal (square 2) 2
# grains on square 3
assert equal (square 3) 4
# grains on square 4
assert equal (square 4) 8
# grains on square 16
assert equal (square 16) 32768
# grains on square 32
assert equal (square 32) 2147483648
# grains on square 64
assert equal (square 64) 9223372036854775808
# square 0 is invalid
assert error {|| (square 0)}
# negative square is invalid
assert error {|| (square -1)}
# square greater than 64 is invalid
assert error {|| (square 65)}
# returns the total number of grains on the board
assert equal (total) 18446744073709551616 
