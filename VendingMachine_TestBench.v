
`define clock_period 10

module VendingMachine_TestBench();
    reg [3:0] item_number;
    reg nickel_in, dime_in, clock, reset;
    wire nickel_out, dispense;

    // Instantiate the Vending Machine
    VendingMachine VM(
        .item_number(item_number), 
        .nickel_in(nickel_in), 
        .dime_in(dime_in), 
        .clock(clock), 
        .reset(reset), 
        .nickel_out(nickel_out), 
        .dispense(dispense)
    );

    // Clock signal
    initial clock = 1;
    always #(`clock_period/2) clock = ~clock;

    // Test cases
    initial begin
        // Reset
        reset = 1; item_number = 4'b0001; nickel_in = 0; dime_in = 0;
        #(`clock_period);
        reset = 0;

        // Test adding coins
        nickel_in = 1; #(`clock_period); nickel_in = 0;
        dime_in = 1; #(`clock_period); dime_in = 0;

        // Finish
        #(`clock_period*5);
        $finish;
    end

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars;
    end
endmodule
