export def convert [num: int] {
    [3 5 7]
    | zip [Pling Plang Plong]
    | where {|pair| $num mod $pair.0 == 0}
    | each {|pair| $pair.1}
    | if ($in | is-empty) {
        $num | into string
    } else { $in | str join }
}
