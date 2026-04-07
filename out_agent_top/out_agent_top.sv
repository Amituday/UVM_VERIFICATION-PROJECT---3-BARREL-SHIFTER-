class out_agent_top extends uvm_component; 

    `uvm_component_utils(out_agent_top)

    out_agent agent[];

    env_config e_con; 

    function new(string name="out_agent_top",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    if(!uvm_config_db#(env_config)::get(this,"","env_config",e_con))
      `uvm_fatal(get_type_name(),"could not get in the agent top")

    agent = new[e_con.no_of_out_agent];

    foreach (agent[i]) begin
    agent[i] = out_agent ::type_id::create($sformatf("agent[%0d]",i),this);

    uvm_config_db#(out_agent_config)::set(this,$sformatf("agent[%0d]*",i),"out_agent_config",e_con.out_con[i]);
        
    end

    endfunction 

endclass 



