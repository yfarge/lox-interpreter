CC = gcc
CFLAGS = -Wall -Werror -Iinclude

BINDIR = bin
OBJDIR = obj
SRCDIR = src
INCDIR = include

TARGET = $(BINDIR)/clox

SRC = $(SRCDIR)/main.c $(SRCDIR)/chunk.c $(SRCDIR)/memory.c
OBJ = $(OBJDIR)/main.o $(OBJDIR)/chunk.o $(OBJDIR)/memory.o

all: $(TARGET)

$(TARGET): $(OBJ)
	mkdir -p $(BINDIR)
	$(CC) $(OBJ) -o $(TARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -I$(INCDIR) -c $< -o $@

clean:
	rm -rf $(OBJDIR) $(BINDIR)
