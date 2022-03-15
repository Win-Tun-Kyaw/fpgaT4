# fpgaT4
### controls
Use the right dip switch bank, switches 1 to 6 to select ALUFN

Use the top [0] io button to start the fsm tester for that particular ALUFN

Once selected, we come to the START state, which prints a code to segmented display confirming our selected thing. 

Press the middle [1]  io button to shuffle through the states.

Each component tester has its normal test cases that we cycle through and error test case which jumps to the error state

In our error state we have error flags, that light up an led when it is wrong 

Flags are using the middle io_led banks, starting from the left to right

First flag = (output is wrong?)

Flags, are  z or v or n wrong?


Checkoff leds use the left io_led banks

Lights up from left to right

Each light shows which case we are on

When reach the END state we also light led

So if all cases are correct we light 1 extra led

Error state we write DEAD to segmented display so we know this is a trap.

Pressing the error state moves to show the END state. C001 is written to segmented display.

Press the reset button at the bottom layer, to choose a new ALUFN.

For BOOL, all the test cases are in one fsm, selecting any of the 4 ALUFN for BOOL will go to the same fsm containing all four ALUFN tests and error catch
