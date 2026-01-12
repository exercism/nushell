use isogram.nu is_isogram
use std/assert

assert equal (is_isogram "") true
assert equal (is_isogram "isogram") true
assert equal (is_isogram "eleven") false
assert equal (is_isogram "zzyzx") false
assert equal (is_isogram "subdermatoglyphic") true
assert equal (is_isogram "Alphabet") false
assert equal (is_isogram "alphAbet") false
assert equal (is_isogram "thumbscrew-japingly") true
assert equal (is_isogram "thumbscrew-jappingly") false
assert equal (is_isogram "six-year-old") true
assert equal (is_isogram "Emily Jung Schwartzkopf") true
assert equal (is_isogram "accentor") false
assert equal (is_isogram "angola") false
assert equal (is_isogram "up-to-date") false
