# Generateive-AI based HLS Systhesis

This repository contains high-level C++ designs converted into RTL (Verilog) using Generative AI techniques like Large Language Models (LLMs). It also includes testbenches and simulation outputs.

## 📂 Folder Structure
📁 ML in VLSI CAD

┣ 📂 C++_Designs/ # High-Level C++ HLS designs

┣ 📂 RTL/ # AI-generated Verilog/VHDL RTL files

┣ 📂 Testbenches/ # Testbenches for verification

┣ 📂 Simulation_Results/ # Simulation waveforms

┗ 📜 README.md # Project details

## 🚀 Getting Started
### Clone Repository
To clone this repository to your local machine, run the following command:
```sh
git clone https://github.com/rdanishb/ML_in_VLSI_CAD.git
cd AI_Generated_RTL
```

## 📌 Usage
- The C++_Designs/ folder contains the original high-level C++ HLS implementations.

- The RTL/ folder contains Verilog/VHDL files generated using AI techniques.

- The Testbenches/ folder contains testbenches for verifying the RTL.

- The Simulation_Results/ folder contains waveform outputs and simulation logs.

## 🔧 Running Simulation
To verify the AI-generated RTL, follow these steps:

- Navigate to the RTL/ directory.

- Use a simulator such as Vivado, ModelSim, Quartus, or Verilator.

- Compile the RTL and testbench files.

- Run the testbench to verify functionality.

## 🤖 AI-Generated RTL Evaluation
The quality of the AI-generated RTL was analyzed based on the following parameters:

- Number of lines in RTL design – Indicates the verbosity and complexity of the generated code.

- Number of reg and wire variables – Reflects the storage elements and connectivity used.

- Number of lines in procedural blocks (always, initial) – Represents the sequential logic size.

- Number of if-else blocks – Provides insights into the decision-making complexity.

- Number of assign statements – Highlights combinational logic density.

- Number of input/output signals – Measures the design’s external interface complexity.

- Number of loops (for, while) – Assesses the iterative processing complexity.

- Number of case statements – Evaluates structured decision-making efficiency.
  
All AI-generated RTL designs were successfully simulated, so simulation-based parameters were not included in the evaluation.



## License

[MIT](https://choosealicense.com/licenses/mit/)
