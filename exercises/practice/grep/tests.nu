use std/assert
use ./grep.nu
"Achilles sing, O Goddess! Peleus' son;
His wrath pernicious, who ten thousand woes
Caused to Achaia's host, sent many a soul
Illustrious into Ades premature,
And Heroes gave (so stood the will of Jove)
To dogs and to all ravening fowls a prey,
When fierce dispute had separated once
The noble Chief Achilles from the son
Of Atreus, Agamemnon, King of men." o> iliad.txt

"I do entreat your grace to pardon me.
I know not by what power I am made bold,
Nor how it may concern my modesty,
In such a presence here to plead my thoughts;
But I beseech your grace that I may know
The worst that may befall me in this case,
If I refuse to wed Demetrius." o> midsummer-night.txt
"Of Mans First Disobedience, and the Fruit
Of that Forbidden Tree, whose mortal tast
Brought Death into the World, and all our woe,
With loss of Eden, till one greater Man
Restore us, and regain the blissful Seat,
Sing Heav'nly Muse, that on the secret top
Of Oreb, or of Sinai, didst inspire
That Shepherd, who first taught the chosen Seed" o> paradise-lost.txt
# Prevent conflicts with the system grep command when run on Linux
let tmp_path = $env.PATH
$env.PATH = []
# One file, one match, no flags
assert equal (grep Agamemnon [] [iliad.txt]) "Of Atreus, Agamemnon, King of men."
# One file, one match, print line numbers flag
assert equal (grep Forbidden [-n] [paradise-lost.txt]) "2:Of that Forbidden Tree, whose mortal tast"
# One file, one match, case-insensitive flag
assert equal (grep FORBIDDEN [-i] [paradise-lost.txt]) "Of that Forbidden Tree, whose mortal tast"
# One file, one match, print file names flag
assert equal (grep Forbidden [-l] [paradise-lost.txt]) "paradise-lost.txt"
# One file, one match, match entire lines flag
assert equal (grep "With loss of Eden, till one greater Man" [-x] [paradise-lost.txt]) "With loss of Eden, till one greater Man"
# One file, one match, multiple flags
assert equal (grep "OF ATREUS, Agamemnon, KIng of MEN." [-n, -i, -x] [iliad.txt]) "9:Of Atreus, Agamemnon, King of men."
# One file, several matches, no flags
assert equal (grep may [] [midsummer-night.txt]) "Nor how it may concern my modesty,
But I beseech your grace that I may know
The worst that may befall me in this case,"
# One file, several matches, print line numbers flag
assert equal (grep may [-n] [midsummer-night.txt]) "3:Nor how it may concern my modesty,
5:But I beseech your grace that I may know
6:The worst that may befall me in this case,"
# One file, several matches, match entire lines flag
assert equal (grep may [-x] [midsummer-night.txt]) ""
# One file, several matches, case-insensitive flag
assert equal (grep ACHILLES [-i] [iliad.txt]) "Achilles sing, O Goddess! Peleus' son;
The noble Chief Achilles from the son"
# One file, several matches, inverted flag
assert equal (grep Of [-v] [paradise-lost.txt]) "Brought Death into the World, and all our woe,
With loss of Eden, till one greater Man
Restore us, and regain the blissful Seat,
Sing Heav'nly Muse, that on the secret top
That Shepherd, who first taught the chosen Seed"
# One file, no matches, various flags
assert equal (grep Gandalf [-n, -l, -x, -i] [iliad.txt]) ""
# One file, one match, file flag takes precedence over line flag
assert equal (grep ten [-n, -l] [iliad.txt]) "iliad.txt"
# One file, several matches, inverted and match entire lines flags
assert equal (grep "Illustrious into Ades premature," [-x, -v] [iliad.txt]) "Achilles sing, O Goddess! Peleus' son;
His wrath pernicious, who ten thousand woes
Caused to Achaia's host, sent many a soul
And Heroes gave (so stood the will of Jove)
To dogs and to all ravening fowls a prey,
When fierce dispute had separated once
The noble Chief Achilles from the son
Of Atreus, Agamemnon, King of men."
# Multiple files, one match, no flags
assert equal (grep Agamemnon [] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt:Of Atreus, Agamemnon, King of men."
# Multiple files, several matches, no flags
assert equal (grep may [] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "midsummer-night.txt:Nor how it may concern my modesty,
midsummer-night.txt:But I beseech your grace that I may know
midsummer-night.txt:The worst that may befall me in this case,"
# Multiple files, several matches, print line numbers flag
assert equal (grep that [-n] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "midsummer-night.txt:5:But I beseech your grace that I may know
midsummer-night.txt:6:The worst that may befall me in this case,
paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast
paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top"
# Multiple files, one match, print file names flag
assert equal (grep who [-l] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt
paradise-lost.txt"
# Multiple files, several matches, case-insensitive flag
assert equal (grep TO [-i] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt:Caused to Achaia's host, sent many a soul
iliad.txt:Illustrious into Ades premature,
iliad.txt:And Heroes gave (so stood the will of Jove)
iliad.txt:To dogs and to all ravening fowls a prey,
midsummer-night.txt:I do entreat your grace to pardon me.
midsummer-night.txt:In such a presence here to plead my thoughts;
midsummer-night.txt:If I refuse to wed Demetrius.
paradise-lost.txt:Brought Death into the World, and all our woe,
paradise-lost.txt:Restore us, and regain the blissful Seat,
paradise-lost.txt:Sing Heav'nly Muse, that on the secret top"
# Multiple files, several matches, inverted flag
assert equal (grep a [-v] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt:Achilles sing, O Goddess! Peleus' son;
iliad.txt:The noble Chief Achilles from the son
midsummer-night.txt:If I refuse to wed Demetrius."
# Multiple files, one match, match entire lines flag
assert equal (grep "But I beseech your grace that I may know" [-x] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "midsummer-night.txt:But I beseech your grace that I may know"
# Multiple files, one match, multiple flags
assert equal (grep "WITH LOSS OF EDEN, TILL ONE GREATER MAN" [-n, -i, -x] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "paradise-lost.txt:4:With loss of Eden, till one greater Man"
# Multiple files, no matches, various flags
assert equal (grep Frodo [-n, -l, -x, -i] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) ""
# Multiple files, several matches, file flag takes precedence over line number flag
assert equal (grep who [-n, -l] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt
paradise-lost.txt"
# Multiple files, several matches, inverted and match entire lines flags
assert equal (grep "Illustrious into Ades premature," [-x, -v] [iliad.txt, midsummer-night.txt, paradise-lost.txt]) "iliad.txt:Achilles sing, O Goddess! Peleus' son;
iliad.txt:His wrath pernicious, who ten thousand woes
iliad.txt:Caused to Achaia's host, sent many a soul
iliad.txt:And Heroes gave (so stood the will of Jove)
iliad.txt:To dogs and to all ravening fowls a prey,
iliad.txt:When fierce dispute had separated once
iliad.txt:The noble Chief Achilles from the son
iliad.txt:Of Atreus, Agamemnon, King of men.
midsummer-night.txt:I do entreat your grace to pardon me.
midsummer-night.txt:I know not by what power I am made bold,
midsummer-night.txt:Nor how it may concern my modesty,
midsummer-night.txt:In such a presence here to plead my thoughts;
midsummer-night.txt:But I beseech your grace that I may know
midsummer-night.txt:The worst that may befall me in this case,
midsummer-night.txt:If I refuse to wed Demetrius.
paradise-lost.txt:Of Mans First Disobedience, and the Fruit
paradise-lost.txt:Of that Forbidden Tree, whose mortal tast
paradise-lost.txt:Brought Death into the World, and all our woe,
paradise-lost.txt:With loss of Eden, till one greater Man
paradise-lost.txt:Restore us, and regain the blissful Seat,
paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
paradise-lost.txt:Of Oreb, or of Sinai, didst inspire
paradise-lost.txt:That Shepherd, who first taught the chosen Seed"
# Restore path
$env.PATH = $tmp_path
