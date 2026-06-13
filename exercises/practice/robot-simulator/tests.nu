use robot-simulator.nu run
use std/assert
# changes north to east
assert equal ({position: {x: 0, y: 0}, direction: north} | run R) {position: {x: 0, y: 0}, direction: east}

# changes east to south
assert equal ({position: {x: 0, y: 0}, direction: east} | run R) {position: {x: 0, y: 0}, direction: south}

# changes south to west
assert equal ({position: {x: 0, y: 0}, direction: south} | run R) {position: {x: 0, y: 0}, direction: west}

# changes west to north
assert equal ({position: {x: 0, y: 0}, direction: west} | run R) {position: {x: 0, y: 0}, direction: north}

# changes north to west
assert equal ({position: {x: 0, y: 0}, direction: north} | run L) {position: {x: 0, y: 0}, direction: west}

# changes west to south
assert equal ({position: {x: 0, y: 0}, direction: west} | run L) {position: {x: 0, y: 0}, direction: south}

# changes south to east
assert equal ({position: {x: 0, y: 0}, direction: south} | run L) {position: {x: 0, y: 0}, direction: east}

# changes east to north
assert equal ({position: {x: 0, y: 0}, direction: east} | run L) {position: {x: 0, y: 0}, direction: north}

# facing north increments Y
assert equal ({position: {x: 0, y: 0}, direction: north} | run A) {position: {x: 0, y: 1}, direction: north}

# facing south decrements Y
assert equal ({position: {x: 0, y: 0}, direction: south} | run A) {position: {x: 0, y: -1}, direction: south}

# facing east increments X
assert equal ({position: {x: 0, y: 0}, direction: east} | run A) {position: {x: 1, y: 0}, direction: east}

# facing west decrements X
assert equal ({position: {x: 0, y: 0}, direction: west} | run A) {position: {x: -1, y: 0}, direction: west}

# moving east and north from README
assert equal ({position: {x: 7, y: 3}, direction: north} | run RAALAL) {position: {x: 9, y: 4}, direction: west}

# moving west and north
assert equal ({position: {x: 0, y: 0}, direction: north} | run LAAARALA) {position: {x: -4, y: 1}, direction: west}

# moving west and south
assert equal ({position: {x: 2, y: -7}, direction: east} | run RRAAAAALA) {position: {x: -3, y: -8}, direction: south}

# moving east and north
assert equal ({position: {x: 8, y: 4}, direction: south} | run LAAARRRALLLL) {position: {x: 11, y: 5}, direction: north}
