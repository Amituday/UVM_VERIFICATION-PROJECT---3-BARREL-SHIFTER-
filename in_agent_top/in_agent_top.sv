class in_agent_top extends uvm_component; 

    `uvm_component_utils(in_agent_top)

    in_agent agent[];

    env_config e_con; 

    function new(string name="in_agent_top",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    if(!uvm_config_db#(env_config)::get(this,"","env_config",e_con))
      `uvm_fatal(get_type_name(),"could not get in the agent top")

    agent = new[e_con.no_of_in_agent];

    foreach (agent[i]) begin
    agent[i] = in_agent ::type_id::create($sformatf("agent[%0d]",i),this);

    uvm_config_db#(in_agent_config)::set(this,$sformatf("agent[%0d]*",i),"in_agent_config",e_con.in_con[i]);
        
    end

    endfunction 

endclass 



