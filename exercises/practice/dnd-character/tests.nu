use dnd-character.nu [modifier ability character strength dexterity constitution intelligence wisdom charisma hitpoints]
use std/assert

assert equal (modifier 3) (-4)
assert equal (modifier 4) (-3)
assert equal (modifier 5) (-3)
assert equal (modifier 6) (-2)
assert equal (modifier 7) (-2)
assert equal (modifier 8) (-1)
assert equal (modifier 9) (-1)
assert equal (modifier 10) 0
assert equal (modifier 11) 0
assert equal (modifier 12) 1
assert equal (modifier 13) 1
assert equal (modifier 14) 2
assert equal (modifier 15) 2
assert equal (modifier 16) 3
assert equal (modifier 17) 3
assert equal (modifier 18) 4

let ability = ability
assert greater or equal $ability 3
assert less or equal $ability 18

let character = character
let abilities = [(strength $character) (dexterity $character) (constitution $character) (intelligence $character) (wisdom $character) (charisma $character)] 
for ability in $abilities {
    assert greater or equal $ability 3
    assert less or equal $ability 18
}

let character = character
assert equal (strength $character) (strength $character)
let character = character
let abilities1 = [(strength $character) (dexterity $character) (constitution $character) (intelligence $character) (wisdom $character) (charisma $character)]
let abilities2 = [(strength $character) (dexterity $character) (constitution $character) (intelligence $character) (wisdom $character) (charisma $character)] 
assert equal $abilities1 $abilities2

let abilities = 0..100 | each {ability} 
assert greater ($abilities | uniq | length) 1
for ability in $abilities {
    assert greater or equal $ability 3
    assert less or equal $ability 18
}