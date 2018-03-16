DEVICE  = msp430g2553
INSTALL_DIR=$(HOME)/ti/msp430_gcc

GCC_DIR =  $(INSTALL_DIR)/bin
SUPPORT_FILE_DIRECTORY = $(INSTALL_DIR)/include

CC      = $(GCC_DIR)/msp430-elf-gcc
GDB     = $(GCC_DIR)/msp430-elf-gdb

CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -mmcu=$(DEVICE) -Os -g
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY) -T $(DEVICE).ld

all: main.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o main.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o main.asm

debug: all
	$(GDB) main.elf

clean: 
	rm main.elf main.asm
