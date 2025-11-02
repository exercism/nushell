export def keep [list, predicate] {
    let mask = $list | each $predicate
    mut kept = []
    for item in ($list | enumerate) {
        let idx = $item.index
        let item = $item.item
        if ($mask | get $idx) {
            $kept = $kept | append [$item]
        }
    }
    $kept
}

export def discard [list, predicate] {
    let mask = $list | each $predicate
    mut kept = []
    for item in ($list | enumerate) {
        let idx = $item.index
        let item = $item.item
        if not ($mask | get $idx) {
            $kept = $kept | append [$item]
        }
    }
    $kept
}