def convert_day_of_week [dayofweek: string] {
    match ($dayofweek | str lowercase) {
        sunday => "su"
        monday => "mo"
        tuesday => "tu"
        wednesday => "we"
        thursday => "th"
        friday => "fr"
        saturday => "sa"
        _ => (error make {msg: "invalid day of week"})
    }
}

def format_val [val: int] {
    $val
    | fill -a right -c '0' -w 2
}

export def main [
    year: int
    month: int
    week: string
    dayofweek: string
] {
    let possible_days = cal --as-table --full-year $year --month
    | where month == $month
    | get (convert_day_of_week $dayofweek)
    | where {|x| $x | is-not-empty}
    let day = match $week {
        first => ($possible_days | get 0)
        second => ($possible_days | get 1)
        third => ($possible_days | get 2)
        fourth => ($possible_days | get 3)
        last => ($possible_days | last)
        teenth => ($possible_days | intersect [
            13
            14
            15
            16
            17
            18
            19
        ] | first)
    }
    $"($year)-(format_val $month)-(format_val $day)"
}
