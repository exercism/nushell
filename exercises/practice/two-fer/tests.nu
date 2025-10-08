use two-fer.nu two_fer
use std/assert

assert equal (two_fer "Alice") "One for Alice, one for me."

assert equal (two_fer "Bob") "One for Bob, one for me."

assert equal (two_fer) "One for you, one for me."