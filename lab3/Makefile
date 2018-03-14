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

all: prog1 prog2 adc pwm dimmer tones piano

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
dimmer:   dimmer.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o dimmer.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o dimmer.asm
tones:   tones.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o tones.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o tones.asm
piano:   piano.c
	$(CC) $(CFLAGS) $(LFLAGS) $? -o piano.elf
	$(CC) $(CFLAGS) $(LFLAGS) $? -S -o piano.asm

debug: all
	$(GDB) ${EXEC}

clean: 
	rm prog1.elf prog1.asm prog2.elf prog2.asm adc.elf adc.asm \
		pwm.elf pwm.asm dimmer.elf dimmer.asm tones.elf tones.asm piano.elf piano.asm
