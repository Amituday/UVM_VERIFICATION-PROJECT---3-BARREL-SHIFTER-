class out_sequencer extends uvm_sequencer #(in_xtn);

    `uvm_component_utils(out_sequencer)

    function new(string name = "out_sequencer",uvm_component parent);
    super.new(name,parent);

    endfunction 

endclass 

