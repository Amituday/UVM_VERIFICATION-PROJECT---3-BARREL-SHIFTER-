class in_agent extends uvm_agent; 

    `uvm_component_utils(in_agent)

    in_driver drvh;
    in_monitor monh; 
    in_sequencer seqh;

    in_agent_config in_con; 

    function new(string name="in_agent",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      if(!uvm_config_db#(in_agent_config)::get(this,"","in_agent_config",in_con))
        `uvm_fatal(get_type_name(),"could not get in the agent ")

    monh= in_monitor ::type_id::create("monh",this);

    if(in_con.is_active==UVM_ACTIVE)begin 
        drvh=in_driver::type_id::create("drvh",this);
        seqh=in_sequencer::type_id::create("seqh",this);
    end 

    endfunction


    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    if(in_con.is_active == UVM_ACTIVE)begin 
        drvh.seq_item_port.connect(seqh.seq_item_export);
    end 
    endfunction 

endclass 
