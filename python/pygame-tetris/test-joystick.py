import pygame

# Initialize Pygame
pygame.init()

# Initialize Pygame's joystick module
pygame.joystick.init()

# Check if any joystick is connected
if pygame.joystick.get_count() == 0:
    print("No joystick detected!")
else:
    # Initialize the first joystick
    joystick = pygame.joystick.Joystick(0)
    joystick.init()
    print(f"Joystick detected: {joystick.get_name()}")

# Set up the display
screen = pygame.display.set_mode((400, 300))
pygame.display.set_caption("Joystick Test")

# Main loop flag
running = True

# Main loop
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        elif event.type == pygame.JOYBUTTONDOWN:
            print(f"Button {event.button} pressed.")
        elif event.type == pygame.JOYBUTTONUP:
            print(f"Button {event.button} released.")
        elif event.type == pygame.JOYAXISMOTION:
            print(f"Axis {event.axis} moved to {event.value:.2f}.")
        elif event.type == pygame.JOYHATMOTION:
            print(f"Hat {event.hat} moved to {event.value}.")

    # Refresh the display
    screen.fill((0, 0, 0))
    pygame.display.flip()

# Quit Pygame
pygame.quit()
