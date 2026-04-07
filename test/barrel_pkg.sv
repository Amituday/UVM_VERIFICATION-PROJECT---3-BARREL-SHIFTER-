
`include "uvm_macros.svh"
package barrel_pkg;


    import uvm_pkg::*;

    `include "in_xtn.sv"


    `include "in_agent_config.sv"
    `include "out_agent_config.sv"
    `include "env_config.sv"


    `include "in_driver.sv"
    `include "in_monitor.sv"
   
    `include "in_sequencer.sv"
     `include "in_seq.sv"
    `include "in_agent.sv"
    `include "in_agent_top.sv"

    `include "out_driver.sv"
    `include "out_monitor.sv"
   
    `include "out_sequencer.sv"
     `include "out_seq.sv"
    `include "out_agent.sv"
    `include "out_agent_top.sv"

     `include "scoreboard.sv"
     `include "env.sv"

      `include "test.sv"



endpackage