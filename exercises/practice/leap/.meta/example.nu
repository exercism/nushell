export def leapYear [year: int] {
    if $year mod 4 != 0 {
        false
    } else if $year mod 100 != 0 {
        true
    } else {
        $year mod 400 == 0
    }
}
