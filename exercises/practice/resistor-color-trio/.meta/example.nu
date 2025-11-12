def color_code [color] {
    [black brown red orange yellow green blue violet grey white] 
        | enumerate 
        | filter {|item| $item.item == $color} 
        | get index 
        | get 0
}
def value [colors] {
    (color_code $colors.0) * 10 + (color_code $colors.1) 
}

def unit [] {
    let ohms = $in
    if $ohms < 1_000 {
        $"($ohms) ohms"
    } else if $ohms < 1_000_000 {
        $"($ohms / 1_000) kiloohms"
    } else if $ohms < 1_000_000_000 {
        $"($ohms / 1_000_000) megaohms"
    } else {
        $"($ohms / 1_000_000_000) gigaohms"
    }
}
export def label [colors] {
    (value $colors) * 10 ** ((color_code $colors.2)) | unit
}