#include "raylib.h" 
#include <unistd.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 450
#define GROUND_LEVEL 350
#define OBSTACLE_WIDTH 50
#define OBSTACLE_HEIGHT 50
#define PLAYER_WIDTH 50
#define PLAYER_HEIGHT 50
#define PLAYER_JUMP_HEIGHT 150

int main(void) {
  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "endless runner with raylib");

  int playerPosX = 100;
  int playerPosY = GROUND_LEVEL;
  int obstacleX = SCREEN_WIDTH;
  int jumping = 0;
  int jumpStartY = GROUND_LEVEL;

  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    if (jumping) {
      playerPosY -= 5;
      if (playerPosY <= jumpStartY - PLAYER_JUMP_HEIGHT) {
        jumping = 0;
      }
    } else if (playerPosY < GROUND_LEVEL) {
      playerPosY += 5;
    }

    obstacleX -= 5;

    if (obstacleX < -OBSTACLE_WIDTH) {
      obstacleX = SCREEN_WIDTH;
    }
    
    if (IsKeyPressed(KEY_SPACE) && playerPosY == GROUND_LEVEL) {
      jumping = 1;
      jumpStartY = playerPosY;
    }

    // collision
    if (playerPosX < obstacleX + OBSTACLE_WIDTH 
        && playerPosX + PLAYER_WIDTH > obstacleX
        && playerPosY + PLAYER_HEIGHT > GROUND_LEVEL) {

      BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawText("Gamer Over", SCREEN_WIDTH/2 - 100, SCREEN_HEIGHT/2, 20, RED);

      EndDrawing();

      sleep(5);
      break;
    }

    // drawing section
    BeginDrawing();

    ClearBackground(RAYWHITE);

    DrawRectangle(0, 
        GROUND_LEVEL + PLAYER_HEIGHT, 
        SCREEN_WIDTH, 
        SCREEN_HEIGHT - GROUND_LEVEL - PLAYER_HEIGHT, 
        DARKGRAY
    );

    DrawRectangle(playerPosX, playerPosY, PLAYER_WIDTH, PLAYER_HEIGHT, BLUE);

    DrawRectangle(obstacleX, GROUND_LEVEL, OBSTACLE_WIDTH, OBSTACLE_HEIGHT, RED);

    DrawText("Press [space] to jump. avoid obstacles.", 10, 10, 20, DARKGRAY);

    EndDrawing();

  } // end while loop 

  CloseWindow();

  return 0;

}

