def caesar_cipher [text, shift] {
    text | split chars | each {|c|
    if ($c =~ "[A-Z]") {
      char --integer  (((($c | encode hex | into int --radix 16) + shift) - ('A'| encode hex | into int --radix 16)) mod 26 + ('A'| encode hex | into int --radix 16));
    
    } else if ($c =~ "[a-z]") {
      char --integer  (((($c | encode hex | into int --radix 16) + shift) - ('a'| encode hex | into int --radix 16)) mod 26 + ('a'| encode hex | into int --radix 16));
    
    } else {
      $c
    }
  } | str join
}
