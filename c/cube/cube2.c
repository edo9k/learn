#include <SDL2/SDL.h>
#include <stdbool.h>
#include <math.h>

const int SCREEN_WIDTH = 800;
const int SCREEN_HEIGHT = 600;

void drawCube(SDL_Renderer *renderer, float angle, float spinAngle) {
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);

  SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);

  // Define cube vertices
  float vertices[8][3] = {
    {-50, -50, -50},
    {50, -50, -50},
    {50, 50, -50},
    {-50, 50, -50},
    {-50, -50, 50},
    {50, -50, 50},
    {50, 50, 50},
    {-50, 50, 50}
  };

  // Rotate cube around the Y-axis
  for (int i = 0; i < 8; i++) {
    float x = vertices[i][0];
    float z = vertices[i][2];
    vertices[i][0] = x * cos(angle) - z * sin(angle);
    vertices[i][2] = x * sin(angle) + z * cos(angle);
  }

  // Spin the cube around its local Z-axis
  for (int i = 0; i < 8; i++) {
    float x = vertices[i][0];
    float y = vertices[i][1];
    vertices[i][0] = x * cos(spinAngle) - y * sin(spinAngle);
    vertices[i][1] = x * sin(spinAngle) + y * cos(spinAngle);
  }

  // Draw lines connecting the vertices to form the cube
  for (int i = 0; i < 4; i++) {
    SDL_RenderDrawLine(renderer, vertices[i][0] + SCREEN_WIDTH / 2, vertices[i][1] + SCREEN_HEIGHT / 2,
        vertices[(i + 1) % 4][0] + SCREEN_WIDTH / 2, vertices[(i + 1) % 4][1] + SCREEN_HEIGHT / 2);
    SDL_RenderDrawLine(renderer, vertices[i + 4][0] + SCREEN_WIDTH / 2, vertices[i + 4][1] + SCREEN_HEIGHT / 2,
        vertices[((i + 1) % 4) + 4][0] + SCREEN_WIDTH / 2, vertices[((i + 1) % 4) + 4][1] + SCREEN_HEIGHT / 2);
    SDL_RenderDrawLine(renderer, vertices[i][0] + SCREEN_WIDTH / 2, vertices[i][1] + SCREEN_HEIGHT / 2,
        vertices[i + 4][0] + SCREEN_WIDTH / 2, vertices[i + 4][1] + SCREEN_HEIGHT / 2);
  }

  SDL_RenderPresent(renderer);
}

int main() {
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
    return 1;
  }

  SDL_Window *window = SDL_CreateWindow("Rotating and Spinning Cube", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
      SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);

  if (!window) {
    printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
    return 1;
  }

  SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
  if (!renderer) {
    printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
    return 1;
  }

  bool quit = false;
  SDL_Event e;

  float angle = 0.01f;
  float spinAngle = 0.02f;

  while (!quit) {
    while (SDL_PollEvent(&e) != 0) {
      if (e.type == SDL_QUIT) {
        quit = true;
      }
    }

    drawCube(renderer, angle, spinAngle);
    angle += 0.01f;
    spinAngle += 0.02f;

    SDL_Delay(10); // Add a small delay to control rotation speed
  }

  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();

  return 0;
}

