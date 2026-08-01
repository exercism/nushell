use nucleotide-count.nu nucleotideCounts
use std/assert

assert equal (nucleotideCounts "") {A: 0, C: 0, G: 0, T: 0}
assert equal (nucleotideCounts "G") {A: 0, C: 0, G: 1, T: 0}
assert equal (nucleotideCounts "GGGGGGG") {A: 0, C: 0, G: 7, T: 0}
assert equal (
    nucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
) {A: 20, C: 12, G: 17, T: 21}
assert error {|| (nucleotideCounts "AGXXACT")}
