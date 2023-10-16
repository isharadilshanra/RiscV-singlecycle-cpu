
# Non-pipelined Single Cycle CPU Design

## Introduction

This individual project revolves around the creation of a 32-bit non-pipelined RISC-V processor using an FPGA platform. The primary goal is to gain a deep understanding of computer architecture, particularly microprogramming and instruction execution within the RV32I instruction set. The project also involves the implementation of two new instructions, showcasing a solid grasp of micro-architecture and hardware efficiency.

## Design Approach

The project employs a combinational approach, known as a microprogrammed processor. In this approach, instruction decoding is accomplished through microcode—a sequence of control microinstructions stored in a control store or ROM. This microcode, selected based on the opcode extracted from the instruction, directs the processor's operations.

## Objectives

The central objective of the project is to develop a fully operational RISC-V processor capable of handling essential instruction types such as R, I, S, and SB. In addition, the project includes the integration of custom instructions, MEMCOPY and MUL, designed to enhance the processor's functionality.

## Implementation Overview

The processor utilizes a three-bus architecture and consists of three primary components: the controller, ALU (Arithmetic Logic Unit) controller, and datapath. Several modifications were made to these components to accommodate the new instructions.

- **MEMCOPY**: A new instruction introduced for memory copying tasks.
- **MUL**: Added to handle multiplication, which was not part of the original processor's design. The architecture is based on 32-bit registers, with multiplication constrained to 16-bit numbers.

## Execution Process

In this implementation, the instruction is accessed using the program counter, fetching specific instructions from the instruction memory. The controller examines the instruction's opcode and generates the required control signals based on the instruction type. An ALU controller is designed to handle ALU-related tasks with guidance from the main controller.

The data path is established to perform dedicated tasks in synchronization with the clock, relying on the control signals generated by the controller.

## Inputs and Outputs

Inputs include the clock and reset signals, while outputs consist of the ALU results and other illustrative outputs. When the reset signal is set to a high state, all register values are reset to zero.

For more detailed information on the project, implementation, and testing, please refer to the project documentation.
