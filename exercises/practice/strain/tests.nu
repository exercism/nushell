use strain.nu [keep, discard]
use std/assert

assert equal ([] | keep {|x| true}) []
assert equal ([1, 3, 5] | keep {|x| true}) [1, 3, 5]
assert equal ([1, 3, 5] | keep {|x| false}) []
assert equal ([1, 2, 3] | keep {|x| $x mod 2 == 1}) [1, 3]
assert equal ([1, 2, 3] | keep {|x| $x mod 2 == 0}) [2]
assert equal (["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] | keep {str starts-with "z"}) ["zebra", "zombies", "zealot"]
assert equal ([
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ] | keep {|list| 5 in $list}
        ) [
            [5, 5, 5],
            [5, 1, 2],
            [1, 5, 2],
            [1, 2, 5]
        ]

        
assert equal ([] | discard {|x| true}) []
assert equal ([1, 3, 5] | discard {|x| true}) []
assert equal ([1, 3, 5] | discard {|x| false}) [1, 3, 5]
assert equal ([1, 2, 3] | discard {|x| $x mod 2 == 1}) [2]
assert equal ([1, 2, 3] | discard {|x| $x mod 2 == 0}) [1, 3]
assert equal (["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] | discard {str starts-with "z"}) ["apple", "banana", "cherimoya"]
assert equal ([
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ] | discard {|list| 5 in $list}
        ) [
            [1, 2, 3],
            [2, 1, 2],
            [2, 2, 1]
        ]
