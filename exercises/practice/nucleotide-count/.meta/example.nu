export def nucleotideCounts [strand: string] {
    let chars = $strand
    | split chars

    if ($chars | any {|c| not ($c in [A C G T])}) {
        error make {msg: "Invalid nucleotide in strand"}
    }

    let data = $chars
    | uniq -c

    let counts = $data.value
    | zip $data.count
    | into record

    {
        A: 0
        C: 0
        G: 0
        T: 0
    } | merge $counts
}
