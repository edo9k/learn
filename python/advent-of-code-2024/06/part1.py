from os import system
from time import sleep

from dataclasses import dataclass

# with open('test.txt', 'r') as file:
with open('input.txt', 'r') as file:
    lines = file.readlines()

# Convert the list of lines into a 2D matrix
the_map = [list(line.strip()) for line in lines]

map_width  = len(the_map)
map_height = len(the_map[0])

def clear():
    system("clear")

def pause():
    sleep(0.001) 

@dataclass
class Guard:
    x: int
    y: int
    direction: str = "north" 

    def turn90(self):
        if self.direction == "north": 
            self.direction = "east"

        elif self.direction == "east":
            self.direction = "south"

        elif self.direction == "south":
            self.direction = "west"

        elif self.direction == "west":
            self.direction = "north"

    def out_of_bounds(self) -> bool: 
        x_out = self.x >= map_width or self.x < 0
        y_out = self.y >= map_height or self.y < 0
        return x_out or y_out 

    def next_step(self) -> tuple[int, int]:
        if self.direction == "north": 
            return self.x - 1, self.y
 
        if self.direction == "west":
            return self.x, self.y - 1

        if self.direction == "south":
            return self.x + 1, self.y

        if self.direction == "east":
            return self.x, self.y + 1


def coord_out_of_bounds(x, y) -> bool: 
    return x >= map_width or y >= map_height 


   
def print_map():
    clear()
    for line in the_map:
        print("".join(line))
    print("")
    pause()

def find_guard():
    for i in range(map_width):
        for j in range(map_height):
            if the_map[i][j] == "^":
                return i, j 


x, y = find_guard()

guard = Guard(x, y, "north") 

# do that silly guard walk...
while not guard.out_of_bounds():
    # current guard postion
    x, y = guard.x, guard.y

    # right in front of the guard
    next_position = guard.next_step()
    try: 
        next_tile = the_map[next_position[0]][next_position[1]]

        if next_tile != "#":
            the_map[x][y] = "X"
            guard.x = next_position[0]
            guard.y = next_position[1]
            the_map[guard.x][guard.y] = "^" 
        else: 
            guard.turn90()
            
    except: 
        # set last position before guard is gone.
        the_map[x][y] = "X" 
        # print_map()
        break

    # print_map()


visited_cell_count = 0

for i in range(map_width):
    for j in range(map_height):
        if the_map[i][j] == "X":
            visited_cell_count += 1



print(" --> visited ", visited_cell_count, " cells. ")
