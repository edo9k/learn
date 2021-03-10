#include <stdio.h>
#include <stdlib.h>

#include <X11/Xlib.h>

enum {
  RECT_X = 20,
  RECT_Y = 20,
  RECT_WIDTH  = 10,
  RECT_HEIGHT = 10,

  WIN_X = 10,
  WIN_Y = 10,
  WIN_WIDTH  = 100,
  WIN_HEIGHT = 100,
  WIN_BORDER = 2
};

int main() {
  Display *display;
  Window window;
  XEvent event;
  int screen;

  /* connect to the x server */
  display = XOpenDisplay(NULL);

  if (display == NULL) {
    fprintf(stderr, "Deu ruim na hora de abrir o display.\n");
    exit(1);
  }
  
  screen = DefaultScreen(display);

  /* create window */
  window = XCreateSimpleWindow(
    display, 
    RootWindow(display, screen),
    WIN_X, WIN_Y,
    WIN_WIDTH, WIN_HEIGHT,
    WIN_BORDER,
    BlackPixel(display, screen),
    WhitePixel(display, screen)
  );

  /* process window close event */
  Atom del_window = XInternAtom(display, "WM_DELETE_WINDOW", 0);
  XSetWMProtocols(display, window, &del_window, 1);

  /* select which events we're watching */
  XSelectInput(display, window, ExposureMask | KeyPressMask );

  /* display the window */
  XMapWindow(display, window);

  /* event loop */
  while (1) {
    XNextEvent(display, &event);

    switch (event.type) {
      case KeyPress:
        puts("detected a keypress.\n");
      case ClientMessage:
        goto breakout;
      case Expose:
        /* draw window */
        XFillRectangle(
          display, window, 
          DefaultGC(display, screen),
          RECT_X, RECT_Y, 
          RECT_WIDTH, RECT_HEIGHT
        );
        /* no default */
    }
  }

breakout:

  /* cleanup */

  XDestroyWindow(display, window);

  XCloseDisplay(display);

  puts("it did run, didnt it?\n\n");
  return 0;
}

