class in_xtn extends uvm_sequence_item;

    `uvm_object_utils(in_xtn)

    rand  bit[3:0]data; 
    rand bit[1:0]shift; 
    rand bit dir; 

     bit[3:0]result;



    function new(string name="in_xtn");
    super.new(name);
    endfunction 

    function void do_print (uvm_printer printer);
        super.do_print(printer);

        printer.print_field("data",this.data,4,UVM_DEC);
        printer.print_field("shift",this.shift,2,UVM_DEC);
        printer.print_field("dir",this.dir,1,UVM_DEC);
        printer.print_field("result",this.result,4,UVM_DEC);

    endfunction 

endclass