class out_driver extends uvm_driver #(in_xtn);

    `uvm_component_utils(out_driver)

     virtual barrel_if vif; 
     out_agent_config out_con; 


    function new(string name="out_driver",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase (uvm_phase phase);
    super.build_phase(phase);
        if(!uvm_config_db#(out_agent_config)::get(this,"","out_agent_config",out_con))
          `uvm_fatal(get_type_name(),"the signal couldnot get in the driver")


    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = out_con.vif; 
    endfunction 


    
endclass 





