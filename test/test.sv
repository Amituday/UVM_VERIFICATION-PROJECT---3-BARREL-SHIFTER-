class test extends uvm_test; 

   `uvm_component_utils(test)


    function new(string name = "test",uvm_component parent);
    super.new(name,parent);
    endfunction 


    env e1; 
    env_config e_con;
    in_seq s1;

    int no_of_in_agent=1; 
    int no_of_out_agent=1;

    in_agent_config in_con[];
    out_agent_config out_con[];

    virtual barrel_if vif; 



    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   

    if(!uvm_config_db#(virtual barrel_if)::get(this,"","barrel_if",vif))
      `uvm_fatal(get_type_name(),"the signal couldnot be get in the test")

      e_con = env_config ::type_id::create("env_config",this);
      


      uvm_config_db#(env_config)::set(this,"*","env_config",e_con);

      e_con.no_of_in_agent=no_of_in_agent;
      e_con.no_of_out_agent=no_of_out_agent;

      e_con.in_con = new[no_of_in_agent];
      e_con.out_con = new[no_of_out_agent];

      
      in_con=new[no_of_in_agent];
      foreach(in_con[i])begin 
        in_con[i] = in_agent_config :: type_id ::create($sformatf("in_con[%0d]",i));
        e_con.in_con[i]=in_con[i];
        in_con[i].vif = vif;
        in_con[i].is_active = UVM_ACTIVE;

      end 

       out_con=new[no_of_out_agent];
      foreach(out_con[i])begin 
        out_con[i] = out_agent_config :: type_id ::create($sformatf("out_con[%0d]",i));
        e_con.out_con[i]=out_con[i];
        out_con[i].vif = vif;
       out_con[i].is_active = UVM_PASSIVE;
        
      end 

     e1 = env ::type_id::create("e1",this);
    endfunction 

     function void end_of_elaboration_phase(uvm_phase phase);
     super.end_of_elaboration_phase(phase);
     uvm_top.print_topology;
     endfunction 

     task run_phase(uvm_phase phase);
     phase.raise_objection(this);
      s1  = in_seq ::type_id::create("in_seq");
       s1.start(e1.in_top.agent[0].seqh);

        #10;

     phase.drop_objection(this);
     endtask 


endclass