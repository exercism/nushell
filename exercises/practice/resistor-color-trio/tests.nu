use resistor-color-trio.nu label
use std/assert
assert equal (label [orange orange black]) "33 ohms"
assert equal (label [blue grey brown]) "680 ohms"
assert equal (label [red black red]) "2 kiloohms"
assert equal (label [green brown orange]) "51 kiloohms"
assert equal (label [yellow violet yellow]) "470 kiloohms"
assert equal (label [blue violet blue]) "67 megaohms"
assert equal (label [black black black]) "0 ohms"
assert equal (label [white white white]) "99 gigaohms"
assert equal (label [black grey black]) "8 ohms"
assert equal (label [blue green yellow orange]) "650 kiloohms"