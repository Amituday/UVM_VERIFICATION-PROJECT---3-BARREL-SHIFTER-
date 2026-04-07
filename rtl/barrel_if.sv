interface barrel_if(input bit clk);

    logic [3:0]data;
    logic dir;
    logic [1:0]shift;
    logic [3:0]result;

    clocking in_drv @(posedge clk);
      default input #1 output #0;
      output data; 
      output dir; 
      output shift;

    endclocking

    clocking in_mon @(posedge clk);
      default input #1 output #0;

      input data; 
      input dir; 
      input shift;

    endclocking

    clocking out_mon @(posedge clk);
      default input #1 output #0;

      input result ;

    endclocking


    modport IN_DRV (clocking in_drv);
    modport IN_MON (clocking in_mon);
    modport OUT_MON(clocking out_mon);
    
    
endinterface
