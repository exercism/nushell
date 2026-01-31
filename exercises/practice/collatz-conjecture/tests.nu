use collatz-conjecture.nu steps
use std/assert
# zero steps for one
assert equal (steps 1) 0
# divide if even
assert equal (steps 16) 4
# even and odd steps
assert equal (steps 12) 9
# large number of even and odd steps
assert equal (steps 1000000) 152
# zero is an error
assert equal (try { steps 0 } catch {|e|
  $e.msg
}) "Only positive integers are allowed"
# negative value is an error
assert equal (try { steps (-15) } catch {|e|
  $e.msg
})  "Only positive integers are allowed"
