import random
import pgzrun
import pygame

# Screen dimensions
WIDTH = 600
HEIGHT = 600
CELL_SIZE = 30
COLUMNS = WIDTH // CELL_SIZE
ROWS = HEIGHT // CELL_SIZE

# Colors
COLORS = [
    (0, 0, 0),  # Black for empty spaces
    (255, 0, 0),  # Red
    (0, 255, 0),  # Green
    (0, 0, 255),  # Blue
    (255, 255, 0),  # Yellow
    (0, 255, 255),  # Cyan
    (255, 0, 255),  # Magenta
    (255, 165, 0),  # Orange
]

# Define the shapes of the Tetriminos (tetrominoes)
SHAPES = [
    [[1, 1, 1, 1]],  # I shape
    [[1, 1, 0], [0, 1, 1]],  # Z shape
    [[0, 1, 1], [1, 1, 0]],  # S shape
    [[1, 0, 0], [1, 1, 1]],  # L shape
    [[0, 0, 1], [1, 1, 1]],  # J shape
    [[1, 1, 1], [0, 1, 0]],  # T shape
    [[1, 1], [1, 1]],  # O shape
]

# Game state
grid = [[0 for _ in range(COLUMNS)] for _ in range(ROWS)]
current_shape = None
current_color = None
current_position = [0, 0]
game_over = False

# Timer variables
fall_speed = 0.5  # Time in seconds between each fall step
fall_counter = 0


def new_shape():
    """Create a new shape at a random column position."""
    global current_shape, current_color, current_position
    current_shape = random.choice(SHAPES)
    current_color = random.randint(1, len(COLORS) - 1)
    current_position = [0, COLUMNS // 2 - len(current_shape[0]) // 2]


def check_collision(shape, position):
    """Check if the shape collides with the grid or walls."""
    for y, row in enumerate(shape):
        for x, cell in enumerate(row):
            if cell:
                new_x = position[1] + x
                new_y = position[0] + y
                if new_x < 0 or new_x >= COLUMNS or new_y >= ROWS:
                    return True
                if new_y >= 0 and grid[new_y][new_x]:
                    return True
    return False


def rotate_shape(shape):
    """Rotate the shape 90 degrees clockwise."""
    return [
        [shape[y][x] for y in range(len(shape))]
        for x in range(len(shape[0]) - 1, -1, -1)
    ]


def place_shape():
    """Place the shape onto the grid."""
    for y, row in enumerate(current_shape):
        for x, cell in enumerate(row):
            if cell:
                grid[current_position[0] + y][current_position[1] + x] = current_color


def clear_lines():
    """Clear full lines and shift remaining rows down."""
    global grid
    grid = [row for row in grid if any(cell == 0 for cell in row)]
    cleared_lines = ROWS - len(grid)
    grid = [[0 for _ in range(COLUMNS)] for _ in range(cleared_lines)] + grid


def drop_shape():
    """Drop the shape immediately to the bottom."""
    global current_position
    while not check_collision(
        current_shape, [current_position[0] + 1, current_position[1]]
    ):
        current_position[0] += 1
    place_shape()
    clear_lines()
    new_shape()
    if check_collision(current_shape, current_position):
        global game_over
        game_over = True


def update():
    """Update game state."""
    global game_over, fall_counter

    if game_over:
        return

    # Increment fall counter
    fall_counter += 1 / 60  # Increase counter based on the frame rate (60 FPS)

    # Control the falling speed
    if fall_counter >= fall_speed:
        fall_counter = 0

        # Move shape down
        new_position = [current_position[0] + 1, current_position[1]]
        if not check_collision(current_shape, new_position):
            current_position[0] += 1
        else:
            place_shape()
            clear_lines()
            new_shape()
            if check_collision(current_shape, current_position):
                game_over = True


def draw():
    """Draw the game state to the screen."""
    screen.clear()
    # Draw grid
    for y in range(ROWS):
        for x in range(COLUMNS):
            color = COLORS[grid[y][x]]
            screen.draw.filled_rect(
                Rect((x * CELL_SIZE, y * CELL_SIZE), (CELL_SIZE, CELL_SIZE)), color
            )
            screen.draw.rect(
                Rect((x * CELL_SIZE, y * CELL_SIZE), (CELL_SIZE, CELL_SIZE)), "black"
            )

    # Draw current shape
    for y, row in enumerate(current_shape):
        for x, cell in enumerate(row):
            if cell:
                color = COLORS[current_color]
                screen.draw.filled_rect(
                    Rect(
                        (
                            (current_position[1] + x) * CELL_SIZE,
                            (current_position[0] + y) * CELL_SIZE,
                        ),
                        (CELL_SIZE, CELL_SIZE),
                    ),
                    color,
                )
                screen.draw.rect(
                    Rect(
                        (
                            (current_position[1] + x) * CELL_SIZE,
                            (current_position[0] + y) * CELL_SIZE,
                        ),
                        (CELL_SIZE, CELL_SIZE),
                    ),
                    "black",
                )

    if game_over:
        screen.draw.text(
            "GAME OVER", center=(WIDTH // 2, HEIGHT // 2), fontsize=50, color="white"
        )


def on_key_down(key):
    """Handle key presses."""
    if game_over:
        return

    global current_position, current_shape

    if key == keys.LEFT:
        new_position = [current_position[0], current_position[1] - 1]
        if not check_collision(current_shape, new_position):
            current_position[1] -= 1
    elif key == keys.RIGHT:
        new_position = [current_position[0], current_position[1] + 1]
        if not check_collision(current_shape, new_position):
            current_position[1] += 1
    elif key == keys.DOWN:
        new_position = [current_position[0] + 1, current_position[1]]
        if not check_collision(current_shape, new_position):
            current_position[0] += 1
    elif key == keys.UP:
        new_shape = rotate_shape(current_shape)
        if not check_collision(new_shape, current_position):
            current_shape = new_shape
    elif key == keys.SPACE:
        drop_shape()


def on_joybutton_down(button):
    """Handle joystick button presses."""
    if game_over:
        return

    global current_position, current_shape

    if (
        button == 0
    ):  # Assume button 0 is 'A' or the equivalent drop button on the joystick
        drop_shape()


def on_joyaxis_motion(axis, value):
    """Handle joystick axis movement."""
    if game_over:
        return

    global current_position, current_shape

    if axis == 0:  # Left/Right axis (usually 0 for X-axis)
        if value < -0.5:  # Left
            new_position = [current_position[0], current_position[1] - 1]
            if not check_collision(current_shape, new_position):
                current_position[1] -= 1
        elif value > 0.5:  # Right
            new_position = [current_position[0], current_position[1] + 1]
            if not check_collision(current_shape, new_position):
                current_position[1] += 1

    if axis == 1:  # Up/Down axis (usually 1 for Y-axis)
        if value < -0.5:  # Down
            new_position = [current_position[0] + 1, current_position[1]]
            if not check_collision(current_shape, new_position):
                current_position[0] += 1


# Initialize Pygame's joystick module
pygame.init()
pygame.joystick.init()

# Start a new game
new_shape()

pgzrun.go()
