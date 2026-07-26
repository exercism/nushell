use protein-translation.nu proteins
use std/assert

# Empty RNA sequence results in no proteins
assert equal (proteins "") []
# Methionine RNA sequence
assert equal (proteins AUG) [Methionine]
# Phenylalanine RNA sequence 1
assert equal (proteins UUU) [Phenylalanine]
# Phenylalanine RNA sequence 2
assert equal (proteins UUC) [Phenylalanine]
# Leucine RNA sequence 1
assert equal (proteins UUA) [Leucine]
# Leucine RNA sequence 2
assert equal (proteins UUG) [Leucine]
# Serine RNA sequence 1
assert equal (proteins UCU) [Serine]
# Serine RNA sequence 2
assert equal (proteins UCC) [Serine]
# Serine RNA sequence 3
assert equal (proteins UCA) [Serine]
# Serine RNA sequence 4
assert equal (proteins UCG) [Serine]
# Tyrosine RNA sequence 1
assert equal (proteins UAU) [Tyrosine]
# Tyrosine RNA sequence 2
assert equal (proteins UAC) [Tyrosine]
# Cysteine RNA sequence 1
assert equal (proteins UGU) [Cysteine]
# Cysteine RNA sequence 2
assert equal (proteins UGC) [Cysteine]
# Tryptophan RNA sequence
assert equal (proteins UGG) [Tryptophan]
# STOP codon RNA sequence 1
assert equal (proteins UAA) []
# STOP codon RNA sequence 2
assert equal (proteins UAG) []
# STOP codon RNA sequence 3
assert equal (proteins UGA) []
# Sequence of two protein codons translates into proteins
assert equal (proteins UUUUUU) [Phenylalanine, Phenylalanine]
# Sequence of two different protein codons translates into proteins
assert equal (proteins UUAUUG) [Leucine, Leucine]
# Translate RNA strand into correct protein list
assert equal (proteins AUGUUUUGG) [Methionine, Phenylalanine, Tryptophan]
# Translation stops if STOP codon at beginning of sequence
assert equal (proteins UAGUGG) []
# Translation stops if STOP codon at end of two-codon sequence
assert equal (proteins UGGUAG) [Tryptophan]
# Translation stops if STOP codon at end of three-codon sequence
assert equal (proteins AUGUUUUAA) [Methionine, Phenylalanine]
# Translation stops if STOP codon in middle of three-codon sequence
assert equal (proteins UGGUAGUGG) [Tryptophan]
# Translation stops if STOP codon in middle of six-codon sequence
assert equal (proteins UGGUGUUAUUAAUGGUUU) [Tryptophan, Cysteine, Tyrosine]
# Sequence of two non-STOP codons does not translate to a STOP codon
assert equal (proteins AUGAUG) [Methionine, Methionine]
# Incomplete RNA sequence can translate if valid until a STOP codon
assert equal (proteins UUCUUCUAAUGGU) [Phenylalanine, Phenylalanine]
# Non-existing codon can't translate
assert error {|| (proteins AAA)}
# Unknown amino acids, not part of a codon, can't translate
assert error {|| (proteins XYZ)}
# Incomplete RNA sequence can't translate
assert error {|| (proteins AUGU)}
