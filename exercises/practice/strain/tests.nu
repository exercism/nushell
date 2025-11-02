use strain.nu [keep, discard]
use std/assert

assert equal (keep [] {|x| true}) []
assert equal (keep [1, 3, 5] {|x| true}) [1, 3, 5]
assert equal (keep [1, 3, 5] {|x| false}) []
assert equal (keep [1, 2, 3] {|x| $x mod 2 == 1}) [1, 3]
assert equal (keep [1, 2, 3] {|x| $x mod 2 == 0}) [2]
assert equal (keep ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] {str starts-with "z"}) ["zebra", "zombies", "zealot"]
assert equal (keep [
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ] {|list| 5 in $list}
        ) [
            [5, 5, 5],
            [5, 1, 2],
            [1, 5, 2],
            [1, 2, 5]
        ]

        
assert equal (discard [] {|x| true}) []
assert equal (discard [1, 3, 5] {|x| true}) []
assert equal (discard [1, 3, 5] {|x| false}) [1, 3, 5]
assert equal (discard [1, 2, 3] {|x| $x mod 2 == 1}) [2]
assert equal (discard [1, 2, 3] {|x| $x mod 2 == 0}) [1, 3]
assert equal (discard ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] {str starts-with "z"}) ["apple", "banana", "cherimoya"]
assert equal (discard [
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ] {|list| 5 in $list}
        ) [
            [1, 2, 3],
            [2, 1, 2],
            [2, 2, 1]
        ]
