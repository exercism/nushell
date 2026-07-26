export def square [i: int] {
    if ($i <= 0) or ($i > 64) {
        error make {msg: "i must be an integer from 1 to 64"}
    }
    2.0 ** ($i - 1)
}

export def total [] {
    (2.0 ** 64) - 1
}
