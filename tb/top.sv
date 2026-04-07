`include "uvm_macros.svh"
 module top; 

 import uvm_pkg::*; 

 import barrel_pkg::*;
 

 bit clk = 0;

 always  #5 clk = ~clk ; 

  barrel_if vif(clk);

  barrel dut(
           .clk(clk),
           .data(vif.data),
           .dir(vif.dir),
           .shift(vif.shift),
           .result(vif.result)
           );

initial begin
    uvm_config_db#(virtual barrel_if)::set(null,"*","barrel_if",vif);
    run_test("test");

end
endmodule


