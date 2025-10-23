def macro? [item] {
    let trimmed = ($item | str trim)
    ($trimmed | find --regex "^:\\s+[^\\s]+\\s+.+\\s+;$") == $trimmed
}

def parse_definition [def: string] {
    let parsed = ($def | parse ": {name} {body} ;")
    let name = ($parsed.name | get 0 | str trim | str downcase)
    let tokens = ($parsed.body | get 0 | str trim | split row " ")
    {
        name: $name,
        tokens: $tokens
    }
}

def replace_tokens [tokens: list<string>, defname: string, definition: list<string>] {
    mut result = []
    for token in $tokens {
        let token_lower = ($token | str downcase | str trim)
        let name_lower = ($defname | str downcase | str trim)
        if $token_lower == $name_lower {
            for deftoken in $definition {
                $result = ($result | append $deftoken)
            }
        } else {
            $result = ($result | append $token)
        }
    }
    $result
}

def expand_macros [instructions: list<string>] {
    mut defs = []
    mut program = []
    
    for instr in $instructions {
        if (macro? $instr) {
            let def = parse_definition $instr
            if ($def.name | find --regex "^-?\\d+$") == $def.name {
                error make {msg: "illegal operation"}
            }
            mut tokens = $def.tokens
            for prev_def in $defs {
                $tokens = (replace_tokens $tokens $prev_def.name $prev_def.tokens)
            }
            let matches = ($defs | where name == $def.name)
            if ($matches | length) > 0 {
                $defs = ($defs | where name != $def.name | append {
                    name: $def.name,
                    tokens: $tokens
                })
            } else {
                $defs = ($defs | append {
                    name: $def.name,
                    tokens: $tokens
                })
            }
        } else {
            $program = ($program | append $instr)
        }
    }

    mut result = []
    for line in $program {
        mut tokens = ($line | split row " ")
        mut changed = true
        
        while $changed {
            $changed = false
            mut next = []
            
            for token in $tokens {
                let token_lower = ($token | str downcase)
                let matches = ($defs | where name == $token_lower)
                if ($matches | length) > 0 {
                    let match = ($matches | first)
                    for deftoken in $match.tokens {
                        $next = ($next | append $deftoken)
                    }
                    $changed = true
                } else {
                    $next = ($next | append $token)
                }
            }
            $tokens = $next
        }
        
        $result = ($result | append $tokens)
    }
    
    $result | flatten | str join " "
}

def perform [stack: list<int>, action: string] {
    if ($action | find --regex "-?\\d") == $action { # Literals
        $stack | append ($action | into int)
    } else if $action in ["+", "-", "*", "/", "over", "swap"] { # Binary actions
        match ($stack | length) {
            0 => (error make {msg: "empty stack"})
            1 => (error make {msg: "only one value on the stack"})
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
                    error make {msg: "divide by zero"}
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
            error make {msg: "empty stack"}
        }
        match $action {
            "dup" => ([
                    ($stack | get (($stack | length) - 1)),
                    ($stack | get (($stack | length) - 1))
                ] | prepend ($stack | slice ..-2))
            "drop" => ($stack | slice ..-2)
        }
    } else {
        error make {msg: "undefined operation"}
    }
}

export def evaluate [instructions: list<string>] {
    let program_str = expand_macros $instructions
    let tokens = ($program_str | split row " " | where {|x| $x != ""})
    
    mut stack: list<int> = []
    for token in $tokens {
        let norm = ($token | str downcase | str trim)
        $stack = perform $stack $norm
    }
    $stack
}