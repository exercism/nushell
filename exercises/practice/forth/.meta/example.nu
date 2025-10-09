# def is_macro [instruction: list<string>] {
#     (
#         (($instruction | get 0) == ":") and
#         ($instruction | get (($instruction | length) - 1)) == ";"
#     )
# }
# def expand_macros [instructions: list<string>] {
#   for instruction in ($instructions | enumerate) {
#     let idx = $instruction | get index | get 0
#     let instruction = $instruction | get item | debug | get 0  | split row " "
#     if (is_macro ($instruction)) {
#         let name = ($instruction | get 1)
#         let definition = ($instruction | slice 1..-1 | str join " ")
#         for instruction in ($instructions | slice $idx..) {
#             if (is_macro $instruction) {
#                 let inner_definition = $instruction | slice 1..-1 | each {|item|
#                     if ($item == $name) {
#                         $definition
#                     } else $item
#                 }

#             }
#         }
#     }
#   }
# }
def perform [stack: list<int>, action: string] {
    if ($action | find --regex "-?\\d") == $action { # Literals
        $stack | append ($action | into int)
    } else if $action in ["+", "-", "*", "/", "over", "swap"] { # Binary actions
        match ($stack | length) {
            0 => (error make {"msg": "empty stack"})
            1 => (error make {"msg": "only one value on the stack"})
        }
        match $action {
            "+" => (
                        (
                            (
                                ($stack | get (($stack | length) - 2))
                            ) + ($stack | get (($stack | length) - 1)) 
                    ) | prepend ($stack | slice ..-3)
                )
            "-" => (
                        (
                            (
                                ($stack | get (($stack | length) - 2))
                            ) - ($stack | get (($stack | length) - 1)) 
                    ) | prepend ($stack | slice ..-3)
                )
            "*" => (
                        (
                            (
                                ($stack | get (($stack | length) - 2))
                            ) * ($stack | get (($stack | length) - 1)) 
                    ) | prepend ($stack | slice ..-3)
                )
            "/" => (
                try {
                    (
                        (
                            (($stack | get (($stack | length) - 2))) // ($stack | get (($stack | length) - 1)) 
                        ) | prepend ($stack | slice ..-3)
                    )
                } catch {
                    error make {"msg": "divide by zero"}
                } 
            )
            "over" => ([
                    ($stack | get (($stack | length) - 2)),
                    ($stack | get (($stack | length) - 1)),
                    ($stack | get (($stack | length) - 2))
                ] | prepend ($stack | slice ..-3))
            "swap" => ([
                    ($stack | get (($stack | length) - 1)),
                    ($stack | get (($stack | length) - 2))
                ] | prepend ($stack | slice ..-3))
        }
    } else if $action in ["dup", "drop"] {
        if ($stack | length) == 0 {
            error make {"msg": "empty stack"}
        }
        match $action {
            "dup" => ([
                    ($stack | get (($stack | length) - 1)),
                    ($stack | get (($stack | length) - 1)),
                    
                ] | prepend ($stack | slice ..-2))
            "drop" => ($stack | slice ..-2)
        }
    } else {
        print $action
        error make {"msg": "unknown operation"}
    }
  }
export def evaluate [instructions: list<string>] {
    # $instructions = expand_macros $instructions
    let instruction_list = $instructions | each { |item|
        split row " " 
    } | get 0
    mut stack: list<int> = []
    for instruction in $instruction_list {
        $stack = perform $stack $instruction
    }
    $stack
}