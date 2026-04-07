class out_agent extends uvm_agent; 

    `uvm_component_utils(out_agent)

    out_driver drvh;
    out_monitor monh; 
    out_sequencer seqh;

    out_agent_config out_con; 

    function new(string name="out_agent",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      if(!uvm_config_db#(out_agent_config)::get(this,"","out_agent_config",out_con))
        `uvm_fatal(get_type_name(),"could not get in the agent ")

    monh= out_monitor ::type_id::create("monh",this);

    if(out_con.is_active==UVM_ACTIVE)begin 
        drvh=out_driver::type_id::create("drvh",this);
        seqh=out_sequencer::type_id::create("seqh",this);
    end 

    endfunction


    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    if(out_con.is_active == UVM_ACTIVE)begin 
        drvh.seq_item_port.connect(seqh.seq_item_export);
    end 
    endfunction 

endclass 
