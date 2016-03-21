Github Files 

AWGN_Project_Report.pdf => Report on how the project was done.
Readme.txt => Info about all the files on the repository.


Verilog Files
AWGN.sv => RTL file for AWGN Design.(Contains all modules)
SQRT_POLY.sv => RTL file for Square-root Design.
LOG_POLY.sv => RTL file for Logarithm Design.
SinBlock.sv => RTL file for Sin/Cos Design.
Taus.v => RTL file for Tausworthe URNG.
TausTB.v => Testbench for the AWGN deign.

Netlist Files
AWGN_Netlist.v => Netlist of the main design.

Python File
pyScript.py => Python script to write data into verilog format.

MATLAB files
LOG_poly.m => Matlab file to calculate coefficients for Logarithm unit.
SQRT_poly.m => Matlab file to calculate coefficients for Square unit.
COS_poly.m => Matlab file to calculate coefficients for Sin/Cos unit.
AWGN.m => MATLAB design file of the AWGN.

.txt files => Coefficient tables of all the functons.

Makefile => Makefile to run the verilog codes on Synopsys VCS.
compiler => TCL script to synthesize design.
