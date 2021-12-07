from typing_extensions import Literal

def one(x: Literal[1]) -> Literal[1]:
    return x

one(1) # runs ok

one(2) # -> throws error

# Argument has incompatible type "Literal[2]"; expected "Literal[1]"

