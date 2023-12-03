
from functools import partial
from blessed import Terminal

terminal = Terminal()


def create_board(number_of_pair_cells, even_color, odd_color):
    """ This code comes from Stack Overflow.
        It creates a board with the chosen colors and size. 
    """

    echo = partial(print, end="", flush=True)

    # The height and width values may vary depending on the font size
    # of your terminal.

    # Each value of `cell_height` represents one line.
    cell_height = 1

    # Each value of `cell_width` represents one space.
    # Two more spaces are added by `echo`.
    # In this case, the final computed value is 0 + 2 = 2.
    cell_width = 0

    for i in range(number_of_pair_cells):
        # This generates the intermittent color effect typical of a board.
        if i != 0:
            even_color, odd_color = odd_color, even_color

        # This print the board.
        # I recommend you to replace the `"\n"` and the `" "` with
        # other values to know how this package works.
        # You'll be surprised.
        # Also, I recommend you to replace the `terminal.normal`
        # (that resets the background color) to `terminal.red`,
        # to have more info about the terminal dimensions.
        echo(
            *(
                "\n",
                *(
                    even_color,
                    " " * cell_width,
                    odd_color,
                    " " * cell_width,
                ) * int(number_of_pair_cells / 2),
                terminal.normal,
            ) * cell_height,
        )


# The `on_yellow` value is a reference to a yellow background color.
# This is the same for `on_green`.
# If you want to print a red color over a blue background,
# you need to use `terminal.red` and `terminal.on_blue`.
create_board(10, terminal.on_red, terminal.on_white)
