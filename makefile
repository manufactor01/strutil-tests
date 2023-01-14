CC = gcc
CFLAGS = -g -std=c99 -Wall -Wconversion -Wno-sign-conversion -Werror
VFLAGS = --leak-check=full --show-reachable=yes --track-origins=yes
GFLAGS = -tui
EXEC = pruebas 
OBJFILES = main.o strutil.o testing.o

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $<

$(EXEC): $(OBJFILES)
	$(CC) $(CFLAGS) $(OBJFILES) -o $(EXEC)

all: $(EXEC)

run: all 
	./$(EXEC)

valgrind: all
	valgrind $(VFLAGS) ./pruebas

clear: $(OBJFILES)
	rm -f pruebas *.o

gdb: all 
	gdb -tui ./pruebas
