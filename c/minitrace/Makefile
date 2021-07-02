GEN_TABLES=./gen_tables.py
LINUX_SRC=~/Downloads/linux2.6/usr/src/something

all: minitrace

minitrace.o: syscalls.h syscallents.h

syscallents.h: $(GEN_TABLES)
	$(GEN_TABLES) $(LINUX_SRC)
