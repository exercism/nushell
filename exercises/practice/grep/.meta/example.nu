def make_options [flags: list<string>, files: list<string>] {
    {
        filename: (($files | length) != 1),
        line_number: (-n in $flags),
        insensitive: (-i in $flags),
        names_only: (-l in $flags),
        inverted: (-v in $flags),
        fullline: (-x in $flags)
    }
}

def grep-single [pattern: string, options: record, file: path] {
    let contents = open --raw $file | split row "\n"
    let contains = if $options.fullline {
        {|pattern, line| $pattern == $line}
    } else {
        {|pattern, line| $pattern in $line}
    }
    let matches = $contents | enumerate |  each {|line| 
        let idx = $line.index
        mut line = $line.item
        mut upcased  = $line
        mut pattern = $pattern
        if $options.insensitive {
            $upcased = $upcased | str upcase
            $pattern = $pattern | str upcase
        }
         
        if $options.inverted xor (do $contains $pattern $upcased) {
            if $options.line_number {
                $line = $"($idx + 1):($line)" 
            }
            if $options.filename {
                $line = $"($file):($line)"
            }
            $line
        }
       
    }
    if $options.names_only {
        if ( $matches | length) > 0 {
            [$file]
        } else {
            []
        }
    } else {
        $matches
    }
}

export def main [pattern: string, flags: list<string>, files: list<string>] {
    let options = make_options $flags $files
    
    
    let results =  $files | each {|file|
        grep-single $pattern $options $file
    }

    $results | flatten | str join "\n"
} 