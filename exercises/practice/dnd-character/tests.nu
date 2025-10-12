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

    {
      "uuid": "385d7e72-864f-4e88-8279-81a7d75b04ad",
      "description": "random character is valid",
      "scenarios": ["random"],
      "property": "character",
      "input": {},
      "expected": {
        "strength": "strength >= 3 && strength <= 18",
        "dexterity": "dexterity >= 3 && dexterity <= 18",
        "constitution": "constitution >= 3 && constitution <= 18",
        "intelligence": "intelligence >= 3 && intelligence <= 18",
        "wisdom": "wisdom >= 3 && wisdom <= 18",
        "charisma": "charisma >= 3 && charisma <= 18",
        "hitpoints": "hitpoints == 10 + modifier(constitution)"
      }
    },
    {
      "uuid": "2ca77b9b-c099-46c3-a02c-0d0f68ffa0fe",
      "description": "each ability is only calculated once",
      "property": "strength",
      "input": {},
      "expected": "strength == strength"
    },
    {
      "uuid": "dca2b2ec-f729-4551-84b9-078876bb4808",
      "reimplements": "2ca77b9b-c099-46c3-a02c-0d0f68ffa0fe",
      "description": "each ability is only calculated once",
      "comments": [
        "Expected values were changed to cover all character abilities"
      ],
      "property": "character",
      "input": {},
      "expected": {
        "strength": "strength == strength",
        "dexterity": "dexterity == dexterity",
        "constitution": "constitution == constitution",
        "intelligence": "intelligence == intelligence",
        "wisdom": "wisdom == wisdom",
        "charisma": "charisma == charisma"
      }
    }
  ]
}