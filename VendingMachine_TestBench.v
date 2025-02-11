// Code your testbench here
// or browse Examples
// Predefining the clock period
`define clock_period 10

// Module for the testbench
module VendingMachine_TestBench();
    // Defining the inputs and the outputs
    reg [3:0] item_number;
    reg rupee_five_in, rupee_ten_in, clock, reset;
    wire rupee_five_out, dispense;
    
    // Calling the module 
    VendingMachine VM(.item_number(item_number), .rupee_five_in(rupee_five_in), .rupee_ten_in(rupee_ten_in), .clock(clock), .reset(reset), .rupee_five_out(rupee_five_out), .dispense(dispense));

    // Intialising the clock value
    initial clock = 1;

    // Updating clock value at a regular interval
    always #(`clock_period/2) clock = (~clock);

    // Input beginning
    initial begin
        // Initialising the values
        item_number = 4'b0010;
        rupee_five_in = 0;
        rupee_ten_in = 0;
        reset = 0;

        // Giving new inputs at regular intervals
        #(`clock_period);
        reset = 1;

        #(`clock_period);
        reset = 0;

        #(`clock_period);
        rupee_five_in = 1;
        rupee_ten_in = 0;
        
        #(`clock_period);
        rupee_five_in = 0; 
        rupee_ten_in = 1;

        #(`clock_period);
        rupee_five_in = 0;
        rupee_ten_in = 0;
        
        #(`clock_period);
        rupee_five_in = 0;
        rupee_ten_in = 1;

        #(`clock_period);
        rupee_five_in = 0;
        rupee_ten_in = 0;

        #(`clock_period);
        rupee_five_in = 0;
        rupee_ten_in = 0;

        #(`clock_period);

        #(`clock_period*5);
        $finish;
    end

    // Dumping the file and variables as I am testing this on EDA playground
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars; 
    end
endmodule
