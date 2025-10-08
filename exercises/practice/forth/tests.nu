# TODO: user-defined word cases.
use forth.nu evaluate
use std/assert
assert equal (evaluate ["1 2 3 4 5"]) [1, 2, 3, 4, 5]
assert equal (evaluate ["-1 -2 -3 -4 -5"]) [-1, -2, -3, -4, -5]

assert equal (evaluate ["1 2 +"]) [3]
assert equal (try {evaluate ["+"]} catch {|e| $e.msg}) "empty stack"
assert equal (try {evaluate ["1 +"]} catch {|e| $e.msg}) "only one value on the stack"
assert equal (evaluate ["1 2 3 +"]) [1, 5]

assert equal (evaluate ["3 4 -"]) [-1]
assert equal (try {evaluate ["-"]} catch {|e| $e.msg}) "empty stack"
assert equal ( try{evaluate ["1 -"]} catch {|e| $e.msg}) "only one value on the stack"
assert equal (evaluate ["1 12 3 -"]) [1, 9]

  
assert equal (evaluate ["2 4 *"]) [8]
assert equal (try {evaluate ["*"]} catch {|e| $e.msg}) "empty stack"
assert equal (try {evaluate ["1 *"]} catch {|e| $e.msg}) "only one value on the stack"
assert equal (evaluate ["1 2 3 *"]) [1, 6]

assert equal (evaluate ["12 3 /"]) [4]
assert equal (evaluate ["8 3 /"]) [2]
assert equal (try {evaluate ["4 0 /"]} catch {|e| $e.msg}) "divide by zero"
assert equal (try {evaluate ["/"]} catch {|e| $e.msg}) "empty stack"
assert equal (try {evaluate ["1 /"]} catch {|e| $e.msg}) "only one value on the stack"
assert equal (evaluate ["1 12 3 /"]) [1, 4]

assert equal (evaluate ["1 2 + 4 -"]) [-1]
assert equal (evaluate ["2 4 * 3 /"]) [2]
assert equal (evaluate ["1 3 4 * +"]) [13]
assert equal (evaluate ["1 3 4 + *"]) [7]

assert equal (evaluate ["1 dup"]) [1, 1]
assert equal (evaluate ["1 2 dup"]) [1, 2, 2]
assert equal (try {evaluate ["dup"]} catch {|e| $e.msg}) "empty stack"

assert equal (evaluate ["1 drop"]) []
assert equal (evaluate ["1 2 drop"]) [1]
assert equal (try {evaluate ["drop"]} catch {|e| $e.msg}) "empty stack"
        
assert equal (evaluate ["1 2 swap"]) [2, 1]
assert equal (evaluate ["1 2 3 swap"]) [1, 3, 2]
assert equal (try {evaluate ["swap"]} catch {|e| $e.msg}) "empty stack"
assert equal (try {evaluate ["1 swap"]} catch {|e| $e.msg}) "only one value on the stack"

 
assert equal (evaluate ["1 2 over"]) [1, 2, 1]
assert equal (evaluate ["1 2 3 over"]) [1, 2, 3, 2]
assert equal (try {evaluate ["over"]} catch {|e| $e.msg}) "empty stack"

assert equal (try {evaluate ["1 over"]} catch {|e| $e.msg}) "only one value on the stack"

assert equal (evaluate [
        ": dup-twice dup dup ;",
        "1 dup-twice"
    ]) [1, 1, 1]
assert equal (evaluate [
        ": countup 1 2 3 ;",
        "countup"
    ]) [1, 2, 3]
assert equal (evaluate [
        ": foo dup ;",
        ": foo dup dup ;",
        "1 foo"
    ]) [1, 1, 1]
assert equal (evaluate [
        ": swap dup ;",
        "1 swap"
    ]) [1, 1]
assert equal (evaluate [
        ": + * ;",
        "3 4 +"
    ]) [12]
assert equal (evaluate [
        ": foo 5 ;",
        ": bar foo ;",
        ": foo 6 ;",
        "bar foo"
    ]) [5, 6]
assert equal (evaluate [
        ": foo 10 ;",
        ": foo foo 1 + ;",
        "foo"
    ]) [11]
assert equal (try {evaluate [": 1 2 ;"]} catch {|e| $e.msg}) "illegal operation"
assert equal (try {evaluate [": -1 2 ;"]} catch {|e| $e.msg}) "illegal operation"
assert equal (try {evaluate ["foo"]} catch {|e| $e.msg}) "undefined operation"

assert equal (evaluate ["1 DUP Dup dup"]) [1, 1, 1, 1]
assert equal (evaluate ["1 2 3 4 DROP Drop drop"]) [1]
assert equal (evaluate ["1 2 SWAP 3 Swap 4 swap"]) [2, 3, 4, 1]
assert equal (evaluate ["1 2 OVER Over over"]) [1, 2, 1, 2, 1]
assert equal (evaluate [
        ": foo dup ;",
        "1 FOO Foo foo"
    ]) [1, 1, 1, 1]
assert equal (evaluate [
        ": SWAP DUP Dup dup ;",
        "1 swap"
    ]) [1, 1, 1, 1]