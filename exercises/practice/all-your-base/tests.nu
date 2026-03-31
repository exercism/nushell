use std/assert
use all-your-base.nu rebase
assert equal ([1] | rebase -i 2 -o 10) [1]
assert equal ([1, 0, 1] | rebase -i 2 -o 10) [5]
assert equal ([5] | rebase -i 10 -o 2) [1, 0, 1]
assert equal ([1, 0, 1, 0, 1, 0] | rebase -i 2 -o 10) [4, 2]
assert equal ([4, 2] | rebase -i 10 -o 2) [1, 0, 1, 0, 1, 0]
assert equal ([1, 1, 2, 0] | rebase -i 3 -o 16) [2, 10]
assert equal ([2, 10] | rebase -i 16 -o 3) [1, 1, 2, 0]
assert equal ([3, 46, 60] | rebase -i 97 -o 73) [6, 10, 45]
assert equal ([] | rebase -i 2 -o 10) [0]
assert equal ([0] | rebase -i 10 -o 2) [0]
assert equal ([0, 0, 0] | rebase -i 10 -o 2) [0]
assert equal ([0, 6, 0] | rebase -i 7 -o 10) [4, 2]
assert equal (try { [0] | rebase -i 1 -o 10 } catch {|e| $e.msg}) "input base must be >= 2"
assert equal (try { [] | rebase -i 0 -o 10 } catch {|e| $e.msg}) "input base must be >= 2"
assert equal (try { [1] | rebase -i -2 -o 10 } catch {|e| $e.msg}) "input base must be >= 2"
assert equal (try { [1,-1, 1, 0, 1, 0] | rebase -i 2 -o 10 } catch {|e| $e.msg}) "all digits must satisfy 0 <= d < input base"
assert equal (try { [1, 2, 1, 0, 1, 0] | rebase -i 2 -o 10 } catch {|e| $e.msg}) "all digits must satisfy 0 <= d < input base"
assert equal (try { [1, 0, 1, 0, 1, 0] | rebase -i 2 -o 1 } catch {|e| $e.msg}) "output base must be >= 2"
assert equal (try { [7] | rebase -i 10 -o 0 } catch {|e| $e.msg}) "output base must be >= 2"
assert equal (try { [1] | rebase -i 2 -o -7 } catch {|e| $e.msg}) "output base must be >= 2"
assert equal (try { [1] | rebase -i -2 -o -7 } catch {|e| $e.msg}) "input base must be >= 2"
