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
prog2: prog2.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o prog2.elf
adc:   adc.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o adc.elf
pwm:   pwm.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o pwm.elf

debug: all
	$(GDB) ${EXEC}

clean: 
	rm *.elf