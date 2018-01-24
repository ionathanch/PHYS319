SOURCES = $(wildcard *.c)
EXEC	= $(patsubst %.c, %.elf, $(SOURCES))
DEVICE  = msp430g2553
INSTALL_DIR=$(HOME)/ti/msp430_gcc

GCC_DIR =  $(INSTALL_DIR)/bin
SUPPORT_FILE_DIRECTORY = $(INSTALL_DIR)/include

CC      = $(GCC_DIR)/msp430-elf-gcc
GDB     = $(GCC_DIR)/msp430-elf-gdb

#O0 works, O1 works, O2 doesn't -Os works
CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -mmcu=$(DEVICE) -Os -g
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY) -T $(DEVICE).ld

all: prog1 prog2 adc pwm

prog1: prog1.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o prog1.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o prog1.asm
prog2: prog2.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o prog2.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o prog2.asm
adc:   adc.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o adc.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o adc.asm
pwm:   pwm.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o pwm.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o pwm.asm

debug: all
	$(GDB) ${EXEC}

clean: 
	rm prog1.elf prog2.elf adc.elf pwm.elf prog1.asm prog2.asm adc.asm pwm.asm