CC=gcc-7
CFLAGS=-g -O0

.PHONY: test clean

all: hello

hello:
	$(CC) $(CFLAGS) hello.c -o hello

clean:
	rm -rf *.o hello *.dSYM

test:
	gdb -q -batch -ex 'b 5' -ex r -ex 'ptype JOHN' hello
