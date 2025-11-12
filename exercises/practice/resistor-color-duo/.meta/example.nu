def color_code [color] {
    [black brown red orange yellow green blue violet grey white] 
        | enumerate 
        | filter {|item| $item.item == $color} 
        | get index 
        | get 0
}
export def value [colors] {
    (color_code $colors.0) * 10 + (color_code $colors.1) 
}