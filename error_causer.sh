
# Test testbench.sv, which contains the hierarchical names we expect to work.
echo "----------------------------------"
echo "Testing testbench.sv using verilator lint. Expecting no errors in hierarchical naming."
echo "----------------------------------"
verilator --lint-only -Wall src/* testbench.sv

# Test testbench_repeatbeginname.sv, which contains nonsensical repeated begin block names
echo "----------------------------------"
echo "Testing testbench_repeatbeginname.sv using verilator lint. Expecting no errors in hierarchical naming."
echo "----------------------------------"
verilator --lint-only -Wall src/* testbench_repeatbeginname.sv
