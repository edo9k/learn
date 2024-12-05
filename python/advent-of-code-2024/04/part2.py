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


# used_letters = set()

def check_xmas(coordenates):
    (x, y) = coordenates

    ne_nw_coordinates = ((x - 1, y - 1), (x + 0, y + 0), (x + 1, y + 1))
    nw_ne_coordinates = ((x - 1, y + 1), (x + 0, y + 0), (x + 1, y - 1))

    #for coord in [*ne_nw_coordinates, *nw_ne_coordinates]:
    #    if coord in used_letters:
    #        return False

    diagonal1 = "".join(map(_, ne_nw_coordinates))
    diagonal2 = "".join(map(_, nw_ne_coordinates)) 

    matches = [ "MAS", "SAM" ] 

    if (diagonal1 == "MAS" or diagonal1 == "SAM") and (diagonal2 == "MAS" or diagonal2 == "SAM"):
        print(f"found at {x} {y}, d1={diagonal1} d2={diagonal2}")

     #   used_letters.update(ne_nw_coordinates)
     #   used_letters.update(nw_ne_coordinates) 

        return True

    return False

xmas_count = 0 

for i in range(len(matrix)):
    for j in range(len(matrix[0])):
        if check_xmas((i, j)):
            xmas_count += 1

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

