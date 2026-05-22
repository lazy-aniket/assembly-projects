ASFLAGS = -g --warn --fatal-warnings
LDFLAGS = -e _start --gc-sections --print-gc-sections -Map main.map

all: main

main: main.o
	ld $(LDFLAGS) -o main main.o

main.o: main.s
	as $(ASFLAGS) -o main.o main.s

run: main
	./main

debug: main
	gdb ./main

clean:
	rm -f main main.o main.map

.PHONY: all run debug clean
