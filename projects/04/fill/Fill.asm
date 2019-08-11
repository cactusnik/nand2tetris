// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@value
M=0 // value for set in screen's map address (if black value -1 else 0)

@SCREEN
D=A
@addr
M=D // add = 16384 (screen's base address)

@8191
D=A
@i
M=D // how meny screen's map address need change

@LISTENKBD
0;JMP // start keyboard listen

(LISTENKBD) // loop for listening kbd
	@KBD
	D=M // RAM[KBD]
	@BLACKSCREEN
	D;JGT // if kbd press

	@WHITESCREEN
	0;JMP

(BLACKSCREEN)
	@value
	D=M
	@LISTENKBD
	D;JLT // screen black continue
	
	@value
	M=-1
	@LOOPSCREEN
	0;JMP // start loop for change screen to black

(RESET)
	@8191
	D=A
	@i
	M=D

	@SCREEN
	D=A
	@addr
	M=D // add = 16384 (screen's base address)

	@LISTENKBD
	0;JMP

(WHITESCREEN)
	@value
	D=M
	@LISTENKBD
	D;JEQ // screen white continue

	@value
	M=0
	@LOOPSCREEN
	0;JMP // start loop for change screen to white

(LOOPSCREEN)
	@i
	D=M
	M=M-1
	@RESET
	D;JLT // if i < 0 goto RESET
	
	@value
	D=M
	@addr
	A=M
	M=D // RAM[addr]=1111111111111111 or RAM[addr]=0000000000000000
	
	@addr
	D=M
	M=D+1 // addr = addr + 1
	@LOOPSCREEN
	0;JMP // goto LOOPSCREEN


