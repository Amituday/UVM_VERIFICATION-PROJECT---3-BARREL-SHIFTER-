class in_seq extends uvm_sequence #(in_xtn);

    `uvm_object_utils(in_seq)

    function new(string name="in_seq");
    super.new(name);
    endfunction 

    task body();
    repeat(10) begin
        req = in_xtn::type_id::create("req");
        start_item(req);
        if(!req.randomize())
            `uvm_fatal("RAND_FAIL", "Randomization failed")
        `uvm_info("SEQ", $sformatf("Randomized: data=%0b shift=%0d dir=%0b",
            req.data, req.shift, req.dir), UVM_NONE)
        finish_item(req);
    end
endtask
endclass 

