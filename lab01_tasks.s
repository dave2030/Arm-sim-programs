/*
-------------------------------------------------------
lab01.s
Assign to and add contents of registers.
-------------------------------------------------------
Author:  Shyam Dave
ID:      180332030
Email:   dave203@mylaurier.ca
Date:    2020-01-06
-------------------------------------------------------
*/
.equ SWI_Exit, 0x11 @ Assign a label to the terminate program code

    MOV R0, #9      @ Store decimal 9 in register R0
    MOV R1, #14    @ Store hex E (decimal 14) in register R1
    ADD R2, R1, R0  @ Add the contents of R0 and R1 and put result in R2
	MOV R3, #8     @ Store decimal 8 in register R3
	ADD R3,R3,R3   @ Add the contents of R3 and R3 and put result in R3
	ADD R4,R2,#5     @ Add the contents of 4 and 5 and put result in R4
    SWI SWI_Exit    @ Terminate the program
	