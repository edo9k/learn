import pygame
import sys
import time
from dataclasses import dataclass

pygame.init()

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450
GROUND_LEVEL = 350
OBSTACLE_WIDTH = 50
OBSTABLE_HEIGHT = 50
PLAYER_WIDTH = 50
PLAYER_HEIGHT = 50
PLAYER_JUMP_HEIGHT = 150

WHITE = (255, 255, 255)
BLUE = (0, 0, 255)
RED = (255, 0, 0)
DARK_GRAY = (169, 169, 169)


@dataclass
class Player:
    x: int
    y: int
    jumping: bool
    jump_start_y: int


@dataclass
class Obstacle:
    x: int


def draw_text(surface, text, size, color, position):
    font = pygame.font.Font(None, size)
    text_surface = font.render(text, True, color)
    surface.blit(text_surface, position)


def handle_collision(player: Player, obstacle: Obstacle) -> bool:
    if (
        player.x < obstacle.x + OBSTACLE_WIDTH
        and player.x + PLAYER_WIDTH > obstacle.x
        and player.y + PLAYER_HEIGHT > GROUND_LEVEL
    ):
        return True
    return False


def update_game_logic(keys, player: Player, obstacle: Obstacle):
    if player.jumping:
        player.y -= 5
        if player.y <= player.jump_start_y - PLAYER_JUMP_HEIGHT:
            player.jumping = False
    else:
        if player.y < GROUND_LEVEL:
            player.y += 5
        if keys[pygame.K_SPACE] and player.y == GROUND_LEVEL:
            player.jumping = True
            player.jump_start_y = player.y

    obstacle.x -= 5

    if obstacle.x < -OBSTACLE_WIDTH:
        obstacle.x = SCREEN_WIDTH


# setup screen
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("endless runner with pygame")

player = Player(x=100, y=GROUND_LEVEL, jumping=False, jump_start_y=GROUND_LEVEL)
obstacle = Obstacle(x=SCREEN_WIDTH)

clock = pygame.time.Clock()


# game loop
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    keys = pygame.key.get_pressed()
    update_game_logic(keys, player, obstacle)

    if handle_collision(player, obstacle):
        screen.fill(WHITE)
        draw_text(
            screen, "Game Over", 74, RED, (SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2)
        )
        pygame.display.flip()
        time.sleep(5)
        pygame.quit()
        sys.exit()

    screen.fill(WHITE)
    pygame.draw.rect(
        screen,
        DARK_GRAY,
        (
            0,
            GROUND_LEVEL + PLAYER_HEIGHT,
            SCREEN_WIDTH,
            SCREEN_HEIGHT - GROUND_LEVEL - PLAYER_HEIGHT,
        ),
    )
    pygame.draw.rect(screen, BLUE, (player.x, player.y, PLAYER_WIDTH, PLAYER_HEIGHT))
    pygame.draw.rect(
        screen, RED, (obstacle.x, GROUND_LEVEL, OBSTACLE_WIDTH, OBSTABLE_HEIGHT)
    )
    draw_text(
        screen, "press [space] to jump. avoid obstacles.", 36, DARK_GRAY, (10, 10)
    )

    pygame.display.flip()
    clock.tick(60)
