# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wno-unused-function

# Flex lexer tool
LEX = flex

# Files
LEXER = src/dog.l
LEXER_C = lex.yy.c  # Generated in the project directory
SRC = src/dog.c
HEADER = src/dog.h
OUT = sourceDOG  # Name of the final executable

# Default target
all: $(OUT)

# Target for generating the lexer C file from .l file
$(LEXER_C): $(LEXER)
	$(LEX) -o $(LEXER_C) $(LEXER)

# Target for compiling the program
$(OUT): $(LEXER_C) $(SRC) $(HEADER)
	$(CC) $(CFLAGS) -o $(OUT) $(LEXER_C) $(SRC)

# Clean up generated files
clean:
	rm -f $(LEXER_C) $(OUT)
