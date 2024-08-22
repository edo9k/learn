# Makefile for Raylib Endless Runner Game

# Compiler
CC = gcc

# Compiler Flags
CFLAGS = -Wall -O2

# Raylib and system libraries
LIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

# Source file
SRC = main.c

# Output binary
OUT = runner

# Default target: compile the game
all: $(OUT)

$(OUT): $(SRC)
	@echo "Compiling $(SRC)..."
	$(CC) $(CFLAGS) -o $(OUT) $(SRC) $(LIBS)

# Clean up: remove the compiled binary
clean:
	@echo "Cleaning up..."
	rm -f $(OUT)

# Run the game
run: $(OUT)
	./$(OUT)

.PHONY: all clean run
