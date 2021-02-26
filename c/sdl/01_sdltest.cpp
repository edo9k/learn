#include <SDL2/SDL.h>
#include <stdio.h>

/* this an SDL2 test from an answer on 
 * Stack Overflow
 */

int main() {
  SDL_Window *p;
  SDL_Renderer *w;

  p = SDL_CreateWindow(
      "Example", 
      SDL_WINDOWPOS_UNDEFINED,
      SDL_WINDOWPOS_UNDEFINED,
      800, 640, 
      SDL_WINDOW_SHOWN
  );

  w = SDL_CreateRenderer(p, -1, 0); 

  SDL_RenderClear(w);

  SDL_SetRenderDrawColor(w, 255, 0, 0, 255);
  SDL_Rect Rect = {220, 140, 200, 200};

  SDL_RenderFillRect(w, &Rect);

  SDL_RenderPresent(w);

  SDL_Delay(3000);

  SDL_DestroyRenderer(w);
  SDL_DestroyWindow(p);
  SDL_Quit();

  return 0;
}

