class out_agent_config extends uvm_object; 

    `uvm_object_utils(out_agent_config)

     virtual barrel_if vif; 

     uvm_active_passive_enum is_active; 
   

    function new(string name="out_agent_config");
    super.new(name);
    endfunction 


endclass 
