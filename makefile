ASM=arm-linux-gnueabihf-as
AFLAGS=
LINK=arm-linux-gnueabihf-gcc-8
LFLAGS=-nostdlib

SRC=
OUT=prog.elf


all: asm link run

asm:
	$(ASM) $(AFLAGS) $(SRC) -o a.o

link:
	$(LINK) $(LFLAGS) a.o -o $(OUT)

run:
	./$(OUT)
