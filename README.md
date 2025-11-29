# ALU

*COMPANY* : CODTECH IT SOLUTIONS

*NAME* : SHUBH KUCHYA

*INTERN ID* : CT04DR1218

*DOMAIN* : VLSI

*DURATION* : 4 WEEKS

*MENTOR* : NEELA SANTOSH

##The objective of this task is to design, implement, and simulate a basic 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU is a fundamental component of a CPU and is responsible for performing arithmetic and logical operations on binary data.

In this task, an 8-bit ALU was created to support five essential operations:

Addition (A + B)

Subtraction (A – B)

Bitwise AND (A & B)

Bitwise OR (A | B)

Bitwise NOT (~A)

The ALU receives two 8-bit inputs (A and B) and a 3-bit opcode that selects the desired operation.
Based on the operation performed, the ALU generates an 8-bit result and updates four status flags:

Z (Zero flag): Indicates if the result equals zero

N (Negative flag): Indicates if the result is negative (MSB = 1)

C (Carry flag): Shows carry-out (for addition) or borrow (for subtraction)

V (Overflow flag): Detects signed arithmetic overflow

A Verilog testbench was also written to verify correct operation of the ALU. The testbench applies multiple input combinations, executes each ALU function, and displays the results and flag values. The design was then simulated on EDA Playground using the Icarus Verilog simulator.

The simulation results confirmed that the ALU correctly performs all required operations and generates proper flag outputs.
This task demonstrates a practical understanding of digital logic design, arithmetic circuits, and hardware description languages.

#OUTPUT

<img width="705" height="716" alt="Image" src="https://github.com/user-attachments/assets/e64f9c5b-3562-48cf-8b42-c2a3aa40eccc" />
