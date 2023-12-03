import random
import time

# Define player and enemy characters
player = "😀"
enemy = "👾"

# Set up game variables
player_position = 10
enemy_position = random.randint(1, 20)

# Main game loop
while True:
    # Display game world
    game_world = [" "] * 30
    game_world[player_position] = player
    game_world[enemy_position] = enemy
    print("".join(game_world))

    # Update player position (based on user input)
    if player_position > 0:
        player_position -= 1

    # Update enemy position
    enemy_position -= 1

    # Check for collisions
    if player_position == enemy_position:
        print("Game Over!")
        break

    # Pause for a moment
    time.sleep(0.5)

