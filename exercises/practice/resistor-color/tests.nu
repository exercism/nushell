use resistor-color.nu [color_code colors]
use std/assert
assert equal (color_code "black") 0
assert equal (color_code "white") 9
assert equal (color_code "orange") 3

assert equal (colors) [black brown red orange yellow green blue violet grey white]