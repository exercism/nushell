use allergies.nu [allergicTo list]
use std/assert

# testing for eggs allergy
assert not (allergicTo eggs 0)
assert (allergicTo eggs 1)
assert (allergicTo eggs 3)
assert not (allergicTo eggs 2)
assert (allergicTo eggs 255)

# testing for peanuts allergy
assert not (allergicTo peanuts 0)
assert (allergicTo peanuts 2)
assert (allergicTo peanuts 7)
assert not (allergicTo peanuts 5)
assert (allergicTo peanuts 255)

# testing for shellfish allergy
assert not (allergicTo shellfish 0)
assert (allergicTo shellfish 4)
assert (allergicTo shellfish 14)
assert not (allergicTo shellfish 10)
assert (allergicTo shellfish 255)

# testing for strawberries allergy
assert not (allergicTo strawberries 0)
assert (allergicTo strawberries 8)
assert (allergicTo strawberries 28)
assert not (allergicTo strawberries 20)
assert (allergicTo strawberries 255)

# testing for tomatoes allergy
assert not (allergicTo tomatoes 0)
assert (allergicTo tomatoes 16)
assert (allergicTo tomatoes 56)
assert not (allergicTo tomatoes 40)
assert (allergicTo tomatoes 255)

# testing for chocolate allergy
assert not (allergicTo chocolate 0)
assert (allergicTo chocolate 32)
assert (allergicTo chocolate 112)
assert not (allergicTo chocolate 80)
assert (allergicTo chocolate 255)

# testing for pollen allergy
assert not (allergicTo pollen 0)
assert (allergicTo pollen 64)
assert (allergicTo pollen 224)
assert not (allergicTo pollen 160)
assert (allergicTo pollen 255)

# testing for cats allergy
assert not (allergicTo cats 0)
assert (allergicTo cats 128)
assert (allergicTo cats 192)
assert not (allergicTo cats 64)
assert (allergicTo cats 255)

# no allergies
assert equal (list 0) []

# just eggs
assert equal (list 1) [eggs]

# just peanuts
assert equal (list 2) [peanuts]

# just strawberries
assert equal (list 8) [strawberries]

# eggs and peanuts
assert equal (list 3) [eggs, peanuts]

# more than eggs but not peanuts
assert equal (list 5) [eggs, shellfish]

# lots of stuff
assert equal (list 248) [strawberries, tomatoes, chocolate, pollen, cats]

# everything
assert equal (list 255) [
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
]

# no allergen score parts
assert equal (list 509) [
    eggs
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
]

# no allergen score parts without highest valid score
assert equal (list 257) [eggs]
