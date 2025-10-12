export def modifier [score: int] { 
    ($score - 10) / 2 | math floor
}

export def ability [] {
    let rolls: list<any> = 1..4 | each {random int 1..6}
    $rolls | sort | reverse | drop 1 | reduce {|it, acc| $acc + $it }
}

export def character [] {
    1..6 | each {ability}
}

export def strength [character: list<int>] {
    $character | get 0
}

export def dexterity [character: list<int>] {
    $character | get 1
}

export def constitution [character: list<int>] {
    $character | get 2
}

export def intelligence [character: list<int>] {
    $character | get 3
}

export def wisdom [character: list<int>] {
    $character | get 4
}

export def charisma [character: list<int>] {
    $character | get 5
}

export def hitpoints [character: list<int>] {
    (modifier (constitution $character)) + 10
}
