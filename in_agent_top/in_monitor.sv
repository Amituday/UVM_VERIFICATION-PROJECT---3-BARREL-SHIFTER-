class in_monitor extends uvm_monitor;

    `uvm_component_utils(in_monitor)

     virtual barrel_if.IN_MON vif; 
     in_agent_config in_con; 

     uvm_analysis_port #(in_xtn)a_port;

    function new(string name="in_monitor",uvm_component parent);
    super.new(name,parent);
    a_port = new("a_port",this);

    endfunction 


    function void build_phase (uvm_phase phase);
    super.build_phase(phase);
        if(!uvm_config_db#(in_agent_config)::get(this,"","in_agent_config",in_con))
          `uvm_fatal(get_type_name(),"the signal couldnot get in the monitor")


    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = in_con.vif; 
    endfunction 

     task run_phase(uvm_phase phase);
    forever begin 
     collect();
    end 

    endtask 

    task collect();
    in_xtn t1;

    t1 = in_xtn ::type_id::create("t1");
    @(vif.in_mon)
       t1.data  = vif.in_mon.data;
      t1.shift  = vif.in_mon.shift ;
      t1.dir = vif.in_mon.dir ;

       a_port.write(t1);


    endtask 


endclass 

