use robot-simulator.nu move
use std/assert
# changes north to east
assert equal ({position: {x: 0, y: 0}, direction: north} | move R) {position: {x: 0, y: 0}, direction: east}

# changes east to south
assert equal ({position: {x: 0, y: 0}, direction: east} | move R) {position: {x: 0, y: 0}, direction: south}

# changes south to west
assert equal ({position: {x: 0, y: 0}, direction: south} | move R) {position: {x: 0, y: 0}, direction: west}

# changes west to north
assert equal ({position: {x: 0, y: 0}, direction: west} | move R) {position: {x: 0, y: 0}, direction: north}

# changes north to west
assert equal ({position: {x: 0, y: 0}, direction: north} | move L) {position: {x: 0, y: 0}, direction: west}

# changes west to south
assert equal ({position: {x: 0, y: 0}, direction: west} | move L) {position: {x: 0, y: 0}, direction: south}

# changes south to east
assert equal ({position: {x: 0, y: 0}, direction: south} | move L) {position: {x: 0, y: 0}, direction: east}

# changes east to north
assert equal ({position: {x: 0, y: 0}, direction: east} | move L) {position: {x: 0, y: 0}, direction: north}

# facing north increments Y
assert equal ({position: {x: 0, y: 0}, direction: north} | move A) {position: {x: 0, y: 1}, direction: north}

# facing south decrements Y
assert equal ({position: {x: 0, y: 0}, direction: south} | move A) {position: {x: 0, y: -1}, direction: south}

# facing east increments X
assert equal ({position: {x: 0, y: 0}, direction: east} | move A) {position: {x: 1, y: 0}, direction: east}

# facing west decrements X
assert equal ({position: {x: 0, y: 0}, direction: west} | move A) {position: {x: -1, y: 0}, direction: west}

# moving east and north from README
assert equal ({position: {x: 7, y: 3}, direction: north} | move RAALAL) {position: {x: 9, y: 4}, direction: west}

# moving west and north
assert equal ({position: {x: 0, y: 0}, direction: north} | move LAAARALA) {position: {x: -4, y: 1}, direction: west}

# moving west and south
assert equal ({position: {x: 2, y: -7}, direction: east} | move RRAAAAALA) {position: {x: -3, y: -8}, direction: south}

# moving east and north
assert equal ({position: {x: 8, y: 4}, direction: south} | move LAAARRRALLLL) {position: {x: 11, y: 5}, direction: north}
