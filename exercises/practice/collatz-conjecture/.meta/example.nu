export def steps [number] {
    if $number <= 0 {
        error make {msg: "Only positive integers are allowed"}
    }
    mut number = $number
    mut steps = 0
    while $number != 1 {
        $steps += 1
        if ($number mod 2) == 1 {
            $number *= 3
            $number += 1
        } else {
            $number /= 2
        }
    }
    $steps
}
