class in_driver extends uvm_driver #(in_xtn);

    `uvm_component_utils(in_driver)

     virtual barrel_if.IN_DRV vif; 
     in_agent_config in_con; 


    function new(string name="in_driver",uvm_component parent);
    super.new(name,parent);
    endfunction 


    function void build_phase (uvm_phase phase);
    super.build_phase(phase);
        if(!uvm_config_db#(in_agent_config)::get(this,"","in_agent_config",in_con))
          `uvm_fatal(get_type_name(),"the signal couldnot get in the driver")


    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = in_con.vif; 
    endfunction 

    task run_phase(uvm_phase phase);
    forever begin 
     seq_item_port.get_next_item(req);
     send_to_dut();
     seq_item_port.item_done();
    end 

    endtask 

    task send_to_dut();
   

    @(vif.in_drv)
     vif.in_drv.data <= req.data;
     vif.in_drv.shift <= req.shift;
     vif.in_drv.dir   <= req.dir;
    

    // $display("to the dut");
    // req.print();

    endtask 




endclass 





