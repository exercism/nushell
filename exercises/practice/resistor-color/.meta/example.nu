export def color_code [color] {
    colors | enumerate | filter {|item| $item.item == $color} | get index | get 0
}

export def colors [] {
    [black brown red orange yellow green blue violet grey white]
}