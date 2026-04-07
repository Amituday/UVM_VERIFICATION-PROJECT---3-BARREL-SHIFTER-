class out_monitor extends uvm_monitor;

    `uvm_component_utils(out_monitor)

     virtual barrel_if.OUT_MON vif; 
     out_agent_config out_con; 

     uvm_analysis_port #(in_xtn)a_port1;

    function new(string name="out_monitor",uvm_component parent);
    super.new(name,parent);
    a_port1 =new("a_port1",this);

    endfunction 


    function void build_phase (uvm_phase phase);
    super.build_phase(phase);
        if(!uvm_config_db#(out_agent_config)::get(this,"","out_agent_config",out_con))
          `uvm_fatal(get_type_name(),"the signal couldnot get out the monitor")


    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = out_con.vif; 
    endfunction 
 
      task run_phase(uvm_phase phase);
    forever begin 
     collect();
    end 

    endtask 

    task collect();
    in_xtn rx;
    rx = in_xtn ::type_id::create("rx");
    @(vif.out_mon)
      rx.result = vif.out_mon.result ;
     
       a_port1.write(rx);
       

    endtask 


endclass 

