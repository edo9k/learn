from typing import IO, Any, Union, overload
from typing_extensions import Literal



print("""
we can use @overload to annotate the function, and tell the type checker
which type will be returned, depending on the types of parameters supplied
to the function.
""")

@overload
def open_file(filename: str, mode: Literal['r']) -> IO[str]:
    """called with 'r', the return is 'str'."""

@overload
def open_file(filename: str, mode: Literal['rb']) -> IO[bytes]:
    """called with 'rb', the return is 'bytes'."""

@overload 
def open_file(filename: str, mode: str) -> IO[Any]:
    """any other optins might return anything."""

# actual function
def open_file(filename: str, mode: str) -> IO[Any]:
    return open(filename, mode)

reveal_type(open_file('overload-decorator.py', 'r'))
reveal_type(open_file('overload-decorator.py', 'rb'))
reveal_type(open_file('overload-decorator.py', 'other'))
