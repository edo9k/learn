#include "raylib.h"

typedef enum GameScreen { LOGO = 0, TITLE, GAMEPLAY, ENDING } GameScreen;


int main(void) {

  const int screenWidth  = 800;
  const int screenHeight = 450;

  InitWindow(screenWidth, screenHeight, "raylib [core] example - basic screen manager");

  GameScreen currentScreen = LOGO;

  int framesCounter = 0;

  SetTargetFPS(60);

  while(!WindowShouldClose()) {

    switch(currentScreen) {

      case LOGO:
      {

        framesCounter++;

        if (framesCounter > 120)
          currentScreen = TITLE;

      } break;

      case TITLE:
      {
        if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP)) 
          currentScreen = GAMEPLAY;
      } break;

      case GAMEPLAY:
      {
        if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP))
          currentScreen = ENDING;
      } break;

      case ENDING:
      {
        if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP))
          currentScreen = TITLE;
      } break;

      default: break;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      switch(currentScreen) {

        case LOGO:
        {
          DrawText("LOGO SCREEN", 20, 20, 40, LIGHTGRAY);
          DrawText("WAIT FOR 2 SECONDS...", 290, 220, 20, GRAY); 
        } break;

        case TITLE:
        {
          DrawRectangle(0, 0, screenWidth, screenHeight, GREEN);
          DrawText("TITLE SCREEN", 20, 20, 40, DARKGREEN);
          DrawText("PRESS ENTER OR TAP TO JUMP TO GAMEPLAY SCREEN", 120, 220, 20, DARKGREEN); 
        } break;

        case GAMEPLAY:
        {
          DrawRectangle(0, 0, screenWidth, screenHeight, PURPLE);
          DrawText("GAMEPLAY SCREEN", 20, 20, 40, MAROON);
          DrawText("PRESS ENTER OR TAP TO JUMP TO ENDING SCREEN", 130, 220, 20, MAROON); 
        } break;

        case ENDING:
        {
          DrawRectangle(0, 0, screenWidth, screenHeight, BLUE);
          DrawText("ENDING SCREEN", 20, 20, 40, DARKBLUE);
          DrawText("PRESS ENTER OR TAP TO RETURN TO TITLE SCREEN", 120, 220, 20, DARKBLUE); 
        } break;

        default: break;
      }

    EndDrawing();
  }

  CloseWindow();

  return 0;
} 
