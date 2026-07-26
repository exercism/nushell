const ALLERGENS = [
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
]

def get_value [item: string] {
    $ALLERGENS
    | enumerate
    | where {|row| $row.item == $item}
    | 2 ** ($in.index.0)
}

export def allergicTo [item: string, score: int] {
    let value = get_value $item
    ($score bit-and $value) != 0
}

export def list [score: int] {
    $ALLERGENS
    | where {|allergen| allergicTo $allergen $score}
}
