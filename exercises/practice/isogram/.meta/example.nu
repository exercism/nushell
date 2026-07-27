def clean [phrase: string] {
    $phrase | str lowercase | split chars | where $it in 'abcdefghijklmnopqrstuvwxyz'
}
export def is_isogram [phrase: string] {
    let phrase = clean $phrase
    ($phrase | uniq) == $phrase
}
