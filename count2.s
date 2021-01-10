/*
-------------------------------------------------------
count2.s
A simple count down program (BGE)
-------------------------------------------------------
Author:  Shyam Dave
ID:      180330230
Email:   dave2030@mylaurier.ca
Date:    2018-01-25
-------------------------------------------------------
*/
.equ SWI_Exit, 0x11 @ Terminate program

@ Store data in registers
	MOV	R3, #5		@ Initialize a countdown value
	
TOP:
	SUB	R3, R3, #1	@ Decrement the countdown value
	CMP	R3, #0		@ Compare the countdown value to 0
	BGE	TOP	@ Branch to TOP while >= 0
	
	SWI	SWI_Exit