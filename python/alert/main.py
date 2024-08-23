import sys
import pygame
import time

# Initialize pygame
pygame.init()

# Set up the display
screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
pygame.display.set_caption("Fullscreen Text Display")

# Get the screen width and height
screen_width, screen_height = pygame.display.get_surface().get_size()

# Set up colors
background_color_1 = (255, 0, 0)  # Red color
background_color_2 = (0, 0, 0)  # Black color
text_color = (255, 255, 255)  # White color

# Set up font
font_size = 120  # Font size 120
font = pygame.font.SysFont(None, font_size)

# Get the text from command-line arguments
if len(sys.argv) > 1:
    text = " ".join(sys.argv[1:])
else:
    text = "Alert!"  # Default text if none is provided

# Render the text
text_surface = font.render(text, True, text_color)

# Calculate position to center the text
text_rect = text_surface.get_rect(center=(screen_width // 2, screen_height // 2))

# Load and play the sound file in a loop
pygame.mixer.init()
alert_sound = pygame.mixer.Sound("alert.flac")
alert_sound.play(loops=-1)

# Variables for background flashing
flash_interval = 0.75  # Time interval in seconds to flash the background
current_color = background_color_1
last_flash_time = time.time()

# Main loop to keep the window open
running = True
while running:
    # Flash background color
    current_time = time.time()
    if current_time - last_flash_time > flash_interval:
        current_color = (
            background_color_2
            if current_color == background_color_1
            else background_color_1
        )
        last_flash_time = current_time

    # Fill screen with the current background color
    screen.fill(current_color)

    # Blit the text surface onto the screen
    screen.blit(text_surface, text_rect)

    # Update the display
    pygame.display.flip()

    # Event handling
    for event in pygame.event.get():
        if event.type == pygame.QUIT or (
            event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE
        ):
            running = False

# Stop the sound
alert_sound.stop()

# Quit pygame
pygame.quit()
