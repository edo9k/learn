import sys
import pygame

# Initialize pygame
pygame.init()

# Set up the display
screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
pygame.display.set_caption("Fullscreen Text Display")

# Get the screen width and height
screen_width, screen_height = pygame.display.get_surface().get_size()

# Set the background color (red)
background_color = (255, 0, 0)  # RGB for red
screen.fill(background_color)

# Set up font
font_size = 120  # Very large font size
font = pygame.font.SysFont(None, font_size)

# Get the text from command-line arguments
if len(sys.argv) > 1:
    text = " ".join(sys.argv[1:])
else:
    text = "Hello, World!"  # Default text if none is provided

# Render the text
text_surface = font.render(text, True, (255, 255, 255))  # White color for text

# Calculate position to center the text
text_rect = text_surface.get_rect(center=(screen_width // 2, screen_height // 2))

# Blit the text surface onto the screen
screen.blit(text_surface, text_rect)

# Update the display
pygame.display.flip()

# Main loop to keep the window open
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT or (
            event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE
        ):
            running = False

# Quit pygame
pygame.quit()
