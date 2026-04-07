class env_config extends uvm_object; 

    `uvm_object_utils(env_config)

     in_agent_config in_con[]; 
     out_agent_config out_con[];

     int no_of_in_agent;
     int no_of_out_agent;


    function new(string name="env_config");
    super.new(name);
    endfunction 

endclass