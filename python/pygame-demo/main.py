import pygame
import sys
import random

# Initialize Pygame
pygame.init()

# Game constants
WIDTH = 800
HEIGHT = 600
PLAYER_SIZE = 50
ENEMY_SIZE = 30
PLAYER_SPEED = 5
ENEMY_SPEED = 3
BULLET_SPEED = 7

# Colors
WHITE = (255, 255, 255)
RED = (255, 0, 0)
BLUE = (0, 0, 255)

# Create the game window
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Top-Down Shooter")

# Create the player
player = pygame.Rect(WIDTH // 2, HEIGHT - PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE)

# Create a list to store enemies
enemies = []

# Create a list to store bullets
bullets = []

# Set up the game clock
clock = pygame.time.Clock()

# Game loop
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

        # Shoot bullets when spacebar is pressed
        if event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
            bullet = pygame.Rect(player.centerx - 2, player.top, 4, 10)
            bullets.append(bullet)

    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:
        player.x -= PLAYER_SPEED
    if keys[pygame.K_RIGHT]:
        player.x += PLAYER_SPEED

    # Add new enemies at the top of the screen
    if len(enemies) < 10:
        enemy = pygame.Rect(random.randint(0, WIDTH - ENEMY_SIZE), 0, ENEMY_SIZE, ENEMY_SIZE)
        enemies.append(enemy)

    # Move enemies downwards
    for enemy in enemies:
        enemy.y += ENEMY_SPEED

    # Move bullets upwards
    for bullet in bullets:
        bullet.y -= BULLET_SPEED

    # Check for collisions between bullets and enemies
    for bullet in bullets:
        for enemy in enemies:
            if bullet.colliderect(enemy):
                bullets.remove(bullet)
                enemies.remove(enemy)

    # Check for collisions between player and enemies
    for enemy in enemies:
        if player.colliderect(enemy):
            pygame.quit()
            sys.exit()

    # Clear the screen
    screen.fill(WHITE)

    # Draw player, enemies, and bullets
    pygame.draw.rect(screen, RED, player)
    for enemy in enemies:
        pygame.draw.rect(screen, RED, enemy)
    for bullet in bullets:
        pygame.draw.rect(screen, BLUE, bullet)

    # Update the display
    pygame.display.flip()

    # Limit the frame rate
    clock.tick(30)

