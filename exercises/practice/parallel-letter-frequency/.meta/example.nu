def count [item] {
    let list: list = $in
    $list | where $it == $item | length
}
def count_letters [] {
    let letters: list<string> = $in
    let dedup = $letters | uniq
    $dedup | each {|c| {$c: ($letters | count $c)}} | reduce {|acc, el| $acc | merge $el}
}
def merge_add [second] {
    let first = $in
    let keys = $first | columns | append ($second | columns) | uniq 
    $keys | each {|k| 
        mut sum = 0
        if $k in ($first | columns) { $sum += $first | get $k }
        if $k in ($second | columns) { $sum += $second | get $k }
        {$k: $sum}   
    } | reduce {|acc, el| $acc | merge $el}
}

def make_chunks [texts: list<string>] {
    let text = $texts | str join | split chars | str downcase | where $it in "abcdefghijklmnopqrstuvwxyz"
    let n_chunks = ($text | length) // (sys cpu | length)
    let n_chunks = if ($n_chunks <= 0) {
        1
    } else {
        $n_chunks
    }
    $text | chunks $n_chunks
} 

export def frequencies [texts: list<string>] {
    let chunks = make_chunks $texts
    let counts = $chunks | par-each {count_letters}
    $counts | reduce --fold {} {|acc, el| $acc | merge_add $el}
}
