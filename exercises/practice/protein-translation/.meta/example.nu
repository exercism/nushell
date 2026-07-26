def translate [codon: list<string>] {
    match $codon {
        [A, U, G] => "Methionine"
        [U, U, U] | [U, U, C] => "Phenylalanine"
        [U, U, A] | [U, U, G] => "Leucine"
        [U, C, U] | [U, C, C] | [U, C, A] | [U, C, G] => "Serine"
        [U, A, U] | [U, A, C] => "Tyrosine"
        [U, G, U] | [U, G, C] => "Cysteine"
        [U, G, G] => "Tryptophan"
        [U, A, A] | [U, A, G] | [U, G, A] => "STOP"
        _ => "INVALID"
    }
}

export def proteins [strand: string] {
    let codons = $strand
    | split chars
    | chunks 3
    let n = $codons | length
    generate {|i|
        if $i >= $n {
            return {out: STOP}
        }
        let codon = $codons | get $i
        let translated = translate $codon
        match $translated {
            STOP => {out: $translated}
            INVALID => (error make {msg: "Invalid codon"})
            _ => {out: $translated, next: ($i + 1)}
        }
    } 0
    | if ($in | last) == STOP {
        $in | drop 1
    } else {
        $in
    }
}
