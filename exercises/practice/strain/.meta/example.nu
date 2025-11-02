export def keep [predicate] {
    let mask = $in | each $predicate
    mut kept = []
    for item in ($in | enumerate) {
        let idx = $item.index
        let item = $item.item
        if ($mask | get $idx) {
            $kept = $kept | append [$item]
        }
    }
    $kept
}

export def discard [ predicate] {
    let mask = $in | each $predicate
    mut kept = []
    for item in ($in | enumerate) {
        let idx = $item.index
        let item = $item.item
        if not ($mask | get $idx) {
            $kept = $kept | append [$item]
        }
    }
    $kept
}