# Open the file and read its contents
# with open("test.txt", "r") as file:
with open("input.txt", "r") as file:
    contents = file.read()

lines = contents.splitlines()

# Create a 2D matrix by splitting each line into a list of elements
matrix = [list(line) for line in lines]


def _(coordenates) -> str:
    (x, y) = coordenates

    # prevent python's silly negative array indexing
    if x < 0 or x > (len(matrix) - 1):
        return "?"
    if y < 0 or y > (len(matrix[0]) - 1):
        return "?"

    # probably won't happen anymore, but let's leave the try-catch here
    try:
        return matrix[x][y]
    except:
        return "?"

def horizontal_forward(x, y):
    char_list = map(_,          ((x, y), (x, y + 1), (x, y + 2), (x, y + 3)))
    return "".join(char_list)


def horizontal_backwards(x, y):
    char_list = map(_,          ((x, y), (x, y - 1), (x, y - 2), (x, y - 3)))
    return "".join(char_list)


def vertical_forward(x, y):
    char_list = map(_,          ((x, y), (x + 1, y), (x + 2, y), (x + 3, y)))
    return "".join(char_list)


def vertical_backwards(x, y):
    char_list = map(_,          ((x, y), (x - 1, y), (x - 2, y), (x - 3, y)))
    return "".join(char_list)


def diagonal_north_west(x, y):
    char_list = map(_,          ((x, y), (x + 1, y + 1), (x + 2, y + 2), (x + 3, y + 3)))
    return "".join(char_list)


def diagonal_north_east(x, y):
    char_list = map(_,          ((x, y), (x + 1, y - 1), (x + 2, y - 2), (x + 3, y - 3)))
    return "".join(char_list)


def diagonal_south_west(x, y):
    char_list = map(_,          ((x, y), (x - 1, y + 1), (x - 2, y + 2), (x - 3, y + 3)))
    return "".join(char_list)


def diagonal_south_east(x, y):
    char_list = map(_, ((x, y), (x - 1, y - 1), (x - 2, y - 2), (x - 3, y - 3)))
    return "".join(char_list)


get_words_functions = [
    horizontal_forward,
    horizontal_backwards,
    vertical_forward,
    vertical_backwards,
    diagonal_north_west,
    diagonal_north_east,
    diagonal_south_west,
    diagonal_south_east,
]

xmas_count = 0
for i in range(len(matrix)):
    for j in range(len(matrix[0])):
        for fn in get_words_functions:
            word = fn(i, j)
            if word == "XMAS":
                xmas_count += 1
#                 print("found XMAS at %s %s", i, j)

print("Number of XMAS found was ", xmas_count)


# correcly printing in all directions. 
#
# __ = lambda x: list(map(str, x)) 
# matrix = [ 
#    __([1,2,3]), 
#    __([4,5,6]), 
#    __([7,8,9])
# ]
# for fn in get_words_functions:
#    print(fn(1, 1), fn)
# 
#  1 2 3
#  4 5 6 
#  7 8 9
#

