// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
D=M
@value
M=D // value = R0

@R1
D=M
@i
M=D // i = R1

@result
M=0 // result = 0

(LOOP)
@i
D=M
@STOP
D;JEQ

@value
D=M
@result
M=D+M // result = result + value
@i
M=M-1 // n = n - 1
@LOOP
0;JMP


(STOP)
@result
D=M
@R2
M=D // RAM[2] = result

(END)
@END
0;JMP
