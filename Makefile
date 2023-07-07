NASMFLAGS = -felf64 -g 
CCFLAGS = -no-pie -g -z noexecstack

all: problem1 problem2 problem3 problem4 problem5

%: %.o
	gcc -o $@ $(CCFLAGS) $<

%.o: %.asm
	nasm $(NASMFLAGS) $< -o $@

clean: cleanobj cleanexe

cleanobj:
	rm -f *.o

cleanexe:
	rm problem?
