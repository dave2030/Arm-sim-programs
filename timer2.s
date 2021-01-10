/*
-------------------------------------------------------
lab01_tasks.s
Lab 1
-------------------------------------------------------
Author:  Shyam Dave
ID:      180332030
Email:   dave2030@mylaurier.ca
Date:    2020-01-16
-------------------------------------------------------
*/


.equ SWI_Exit, 0x11     @ Terminate program
.equ SWI_Timer, 0x6d    @ Assign current timer to R0


    @Initializations for variables

    LDR R3, =LOOPS      @Save register 3 for LOOPS
    LDR R4, [R3]        @Initialize loop counter
    LDR R5, =DELAY_TIME @Initialize delay time 
    LDR R6, [R5]

    LDR R7, = ELAPSED
    
TOP:
    LDR R1, =START_TIME
    SWI SWI_Timer    	 @ Put current time in R0
    STR R0, [R1]     	 @ Store start time in START_TIME
    ADD R2, R0, R6	 @ Add delay time to current time (ms)
    
DELAY:
    SWI SWI_Timer    	 @ Get the next tick (ms)
    CMP R0, R2       	 @ Is the current time less than the final time?
    BLT DELAY            @ Yes - continue delay loop
        
    SUB R4, R4, #1   	 @ Decrement the loop counter
    CMP R4, #0
    BGT TOP
    
    LDR R8, =END_TIME    @ Store end time in R8
    SUB R9, R1, R8       @ Subtract start time from end time, store in R9
    STR R7, [R9]         @ R7 = Elapsed, store difference in there.
    
    SWI SWI_Exit


.data   @ Define the data section

START_TIME: .space 4
END_TIME:   .space 4
LOOPS:      .word 10
DELAY_TIME: .word 500
ELAPSED:    .space 4     @Used to store the final time difference