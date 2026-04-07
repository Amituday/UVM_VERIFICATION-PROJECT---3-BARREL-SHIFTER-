class scoreboard extends uvm_scoreboard; 

    `uvm_component_utils(scoreboard)

     uvm_tlm_analysis_fifo#(in_xtn)fifoin; 
     uvm_tlm_analysis_fifo#(in_xtn)fifoout; 

     in_xtn in, out; 

     bit[3:0] result;

     // functional covrage

     covergroup barrel_f;
      option.per_instance=1; 

      cp_dir : coverpoint in.dir{
       bins dir_0 = {0};
        bins dir_1 = {1};

      }

      cp_shift : coverpoint in.shift{
      bins shift_0[] ={[0:3]};
      }

      cp_data : coverpoint in.data{
      bins  low[]={[0:15]};
    //   bins high[]={[8:15]};
      }

      cp_result : coverpoint out.result{
       bins  low[]={[0:15]};
      // bins high[]={[8:15]};
      }

       //cp_cross : cross cp_dir , cp_shift ;
       //cp_cross1 : cross cp_data ,cp_result;

     endgroup


    function new(string name="scoreboard",uvm_component parent);
    super.new(name,parent);
    fifoin = new("fifoin",this);
    fifoout = new("fifoout",this);
    barrel_f = new ;


    endfunction 

    task run_phase(uvm_phase phase);

    forever begin
        fifoin.get(in);
        fifoout.get(out);

         
      if(out.result == result)begin 
        `uvm_info(get_type_name(),$sformatf(" PASS - the expect result = %b || the dut result = %b || data = %b || shift = %0b || dir = %b",result,out.result,in.data,in.shift,in.dir),UVM_LOW)
      end 
       else 
       `uvm_info(get_type_name(),$sformatf(" FAILED - the expect result = %b || the dut result = %b || data = %b || shift = %0b || dir = %b",result,out.result,in.data,in.shift,in.dir),UVM_LOW)
    

             if (in.dir == 1'b0) begin        
        case(in.shift)
            2'b00: result = in.data;
            2'b01: result = {in.data[2:0], 1'b0};
            2'b10: result = {in.data[1:0], 2'b00};
            2'b11: result = {in.data[0],   3'b000};
        endcase
    end else begin                
        case(in.shift)
            2'b00: result = in.data;
            2'b01: result = {1'b0,  in.data[3:1]};
            2'b10: result = {2'b00, in.data[3:2]};
            2'b11: result = {3'b000, in.data[3]};
        endcase
    end
    barrel_f.sample();
end 

    endtask
endclass 


