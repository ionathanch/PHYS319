#include  <msp430.h>

volatile unsigned int i = 0; // Initialize variables. This will keep count of how many cycles between LED toggles

int  main(void)
{
  WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer. This line of code is needed at the beginning of most MSP430 projects.
                            // The watchdog timer can reset the device after a certain period of time.

  P1DIR |= 0x41;            // P1DIR is a register that configures the direction (DIR) of a port pin as an output or an input.

                            // To set a specific pin as output or input, we write a '1' or '0' on the appropriate bit of the register.
                            // P1DIR = <PIN7><PIN6><PIN5><PIN4><PIN3><PIN2><PIN1><PIN0>
                            // Since we want to blink the on-board LEDs, we want to set the direction of Port 1, Pins 0 and 6 (P1.0, P1.6) as outputs

                            // We do that by writing a 1 on the PIN0 and PIN6 bits of the P1DIR register
                            // P1DIR = 0100 0001
                            // P1DIR = 0x41     <-- this is the hexadecimal conversion of 0010 0001
  for (;;)                  // This  for-loop will cause the lines of code within to loop infinitely
    {

      // P1OUT is the register which holds the status of the LEDs.
      // '1' specifies that it's ON or HIGH, while '0' specifies that it's OFF or LOW
      // Since our LEDs are tied to P1.0 and P1.6, we will toggle the appropriate bits in P1OUT

      for(i=0; i< 20000; i++){  // Delay between LED toggles. This for-loop will run until the condition is met.
	if (i == 0)
	  P1OUT ^= 0x01; // toggle the red LED (P1.0)
	if (i == 6000)
	  P1OUT ^= 0x40; // toggle the green LED (P1.6)
	// You need to be a little careful with using for loops for time delays. Optimizing compilers will
	// notice if nothing happens inside a loop, and simply omit the loop to speed up the code.
	// here, we have some comparisons being done inside the loop, so the code runs as desired even if
	// the compiler optimizes.
      }
    }
}
