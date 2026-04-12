def alphabetic [c: string] {
    let c = $c | str downcase 
    $c >= a and $c <= z
}
export def abbreviate [phrase: string] {
    $phrase
    | split chars
    | where (alphabetic $it) or $it in " -"
    | str join
    | split row -r "[ -]"
    | each {|w| $w | split chars | first}
    | str join
    | str upcase
}
