class env extends uvm_env; 

    `uvm_component_utils(env)

     in_agent_top in_top;
     out_agent_top out_top;

     scoreboard sb; 

     function new(string name="env", uvm_component parent);
     super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    in_top = in_agent_top ::type_id::create("in_top",this);
    out_top = out_agent_top::type_id::create("out_top",this);

    sb = scoreboard :: type_id::create("sb",this);
    endfunction 

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      
      in_top.agent[0].monh.a_port.connect(sb.fifoin.analysis_export);
      out_top.agent[0].monh.a_port1.connect(sb.fifoout.analysis_export);

    endfunction 


endclass
