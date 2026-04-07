class out_seq extends uvm_sequence #(in_xtn);

    `uvm_object_utils(out_seq)

    function new(string name="out_seq");
    super.new(name);
    endfunction 

    task body();

    repeat (10)begin 
     req = in_xtn :: type_id :: create("req");
     
      start_item(req);
      assert(req.randomize());
      finish_item(req);

    end 

    endtask 

endclass 

