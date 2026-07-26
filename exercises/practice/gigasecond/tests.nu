use gigasecond.nu add
use std/assert

assert equal (add 2011-04-25) 2043-01-01T01:46:40
assert equal (add 1977-06-13) 2009-02-19T01:46:40
assert equal (add 1959-07-19) 1991-03-27T01:46:40
assert equal (add 2015-01-24T22:00:00) 2046-10-02T23:46:40
assert equal (add 2015-01-24T23:59:59) 2046-10-03T01:46:39

# test immuatability of input
let orig_moment = 2015-01-24T23:59:59
let new_moment = add $orig_moment
assert equal $orig_moment 2015-01-24T23:59:59
