# Vending-machine-system

This repository contains the implementation of a vending machine system using Verilog. The project models the functionality of a vending machine, supporting multiple items, coin-based transactions, and a transaction log system.  

## Features  
- State machine-based design with **5 unique states**.  
- Modular implementation for **4 distinct items**.  
- Supports transactions with nickel (5 Rs) and dime (10 Rs) inputs.  
- Dispenses items and handles incomplete transactions.  
- Testbench with **10+ test cases** to validate functionality.  

## Project Structure  
- **Verilog Design Code**: Contains the implementation of the vending machine system, with separate modules for each item.  
- **Testbench Code**: Simulates various input scenarios and validates state transitions, item dispensing, and change return.  
- **Results**: Includes simulation results showcasing different scenarios.  

## Getting Started  

### Prerequisites  
- Verilog simulator (e.g., ModelSim, Vivado, or EDA Playground).  
- Basic knowledge of Verilog and state machines.  

### Running the Code  
1. Clone the repository:  
   ```bash
   git clone https://github.com/mridul-iiitn/vending-machine-system.git
   cd vending-machine-system
2.Open the Verilog files in your simulator.
3.Run the testbench (VendingMachine_TestBench) to simulate the vending machine functionality.
4.View the output in the waveform or simulation log.

Simulation Scenarios
Adding 5 Rs consecutively three times.
Adding 5 Rs, followed by 10 Rs.
Adding 10 Rs twice.
Adding 5 Rs and then stopping.
Adding 10 Rs and then stopping.

Technologies Used
Language: Verilog (HDL).

Tools: Simulation and testing performed on EDA Playground and compatible simulators
