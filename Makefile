NASMFLAGS = -felf64
CCFLAGS = -no-pie

all: problem1 problem2 problem3 problem5

%: %.o
	gcc -o $@ $(CCFLAGS) $<

%.o: %.asm
	nasm $(NASMFLAGS) $< -o $@

clean: cleanobj cleanexe

cleanobj:
	rm *.o

cleanexe:
	rm problem?
