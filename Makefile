CC=gcc-7
CFLAGS=-g -O0 -v 
DSYMUTIL=dsymutil

.PHONY: test clean

all: hello

hello.o: hello.c
	$(CC) $(CFLAGS) -c hello.c -o hello.o

say.o: say.c
	$(CC) $(CFLAGS) -c say.c -o say.o

hello: hello.o 
	 $(CC) $(CFLAGS) hello.o  -o hello
#	 $(DSYMUTIL) hello

one: 
	$(CC) $(CFLAGS) hello.c -o hello

clean:
	rm -rf *.o hello *.dSYM

test:
	gdb -q -batch -ex 'b 5' -ex r -ex 'ptype JOHN' hello

lldb:
	lldb -batch -o 'b 5' -o r -o 'p name::JOHN' hello
