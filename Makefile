all: problem1 problem2 problem5

problem1: problem1.o
	gcc -o problem1 -no-pie problem1.o

problem1.o: problem1.asm
	nasm -felf64 problem1.asm

problem2: problem2.o
	gcc -o problem2 -no-pie problem2.o

problem2.o: problem2.asm
	nasm -felf64 problem2.asm

problem5: problem5.o
	gcc -o problem5 -no-pie problem5.o

problem5.o: problem5.asm
	nasm -felf64 problem5.asm

clean: cleanobj cleanexe

cleanobj:
	rm *.o

cleanexe:
	rm problem1 problem2 problem5
