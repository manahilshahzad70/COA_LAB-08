# COA_LAB-08

# Computer Architecture Lab

## Lab 08 – Implementation of Program Counter and Instruction Memory

### Lab Description

The purpose of this lab was to understand the implementation and simulation of a Program Counter (PC) and Instruction Memory using Verilog HDL. Different designs were implemented and simulated using ModelSim to understand address generation, sequential instruction execution, memory access, clock signals, and reset functionality.

The tasks implemented in this lab were:

1. Implementation and Simulation of a 4-bit Program Counter
2. Automatic Program Counter Increment and 8-bit Instruction Memory
3. Design and Verification of a 32-bit RV32 Program Counter
4. Integration of a 32-bit Program Counter with 32-bit Instruction Memory
5. Verification of Sequential Instruction Fetching

### Task 1 – Implementation of a 4-bit Program Counter

A 4-bit Program Counter was designed using Verilog HDL to store a 4-bit address. The PC resets to `0000` when the reset signal is activated and loads the input address on every rising edge of the clock. A testbench was used to apply different addresses, and the output was verified using ModelSim waveforms.

### Task 2 – Automatic Program Counter and 8-bit Instruction Memory

An automatic 4-bit Program Counter was implemented to increment its value by 1 after every rising edge of the clock. An 8-bit Instruction Memory containing 16 instruction locations was also designed. The memory returns the instruction corresponding to the supplied address and outputs `00000000` when an invalid address is provided. The simulation verified sequential instruction fetching and invalid address handling.

### Task 3 – Design and Verification of a 32-bit RV32 Program Counter

A 32-bit Program Counter was designed according to the RV32 architecture. It resets to `0x00000000` and increments its address by 4 bytes after every rising edge of the clock to maintain instruction alignment. The lower 4 bits of the PC output were used to provide a smaller address space for testing. ModelSim waveforms were used to verify the reset and increment operations.

### Task 4 – Integration of a 32-bit Program Counter with Instruction Memory

A 32-bit Program Counter was integrated with a 32-bit Instruction Memory using Verilog HDL. The memory contains 16 instruction locations, with each location storing a 32-bit instruction. As the PC increments by 4, the Instruction Memory provides the corresponding instruction for each address. The design also handles invalid or unaligned addresses by returning `0x00000000`. The simulation waveform was used to verify sequential instruction fetching.

### Task 5 – Verification of Sequential Instruction Fetching

The Program Counter and Instruction Memory were used together to demonstrate sequential instruction execution. The PC resets to zero and advances by 4 bytes on each rising clock edge. The Instruction Memory receives the current PC address and returns the instruction stored at that location. The testbench generates clock and reset signals, allowing the instruction-fetching process to be observed through ModelSim waveforms.

### Software Used

- ModelSim

### Conclusion

This lab provided practical experience in designing and simulating Program Counters and Instruction Memories using Verilog HDL. It helped develop an understanding of address generation, clock-controlled operations, reset functionality, memory addressing, and sequential instruction fetching. The implementation of a 32-bit RV32 Program Counter and Instruction Memory further demonstrated how these components work together in a processor to fetch instructions in sequence.

