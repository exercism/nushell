use std/assert
def base_ten [base: number]: list<number> -> number {
    $in | reverse | enumerate | reduce --fold 0 {|el, acc|
        let i = $el.index
        let digit = $el.item
        $acc + $digit * $base ** $i
    }
}
def rebase_from_ten [base: number]: number -> list<number> {
    mut num = $in
    mut out = []
    while $num > 0 {
        let digit = $num mod $base
        $out ++= [$digit]
        $num -= $digit
        $num /= $base
    }
    $out | reverse
}
export def rebase [--input-base (-i): number, --output-base (-o): number]: list<number> -> list<number> {
    assert ($input_base >= 2) "input base must be >= 2"
    assert ($output_base >= 2) "output base must be >= 2"
    let number = $in
    assert ($number | all {|d| 0 <= $d and $d < $input_base }) "all digits must satisfy 0 <= d < input base"
    let number = $number | base_ten $input_base
    let rebased = $number | rebase_from_ten $output_base
    if $rebased == [] { [0] } else $rebased
}
