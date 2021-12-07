from typing_extensions import Literal, Final

def function(x: int = 0, y: Literal[0] = 0) -> int:
    return x + y

x: Final = 0
y: Literal[0] = 0


function(y, y)
function(x, x)

