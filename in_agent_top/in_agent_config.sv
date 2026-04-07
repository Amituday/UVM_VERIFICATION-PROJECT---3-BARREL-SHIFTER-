class in_agent_config extends uvm_object; 

    `uvm_object_utils(in_agent_config)

     virtual barrel_if vif; 

     uvm_active_passive_enum is_active; 
   

    function new(string name="in_agent_config");
    super.new(name);
    endfunction 


endclass 
