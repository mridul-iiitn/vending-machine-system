// Verilog implementation of a vending machine with modular design for multiple items.

// Module for Item 1
module Item_One(nickel_in, dime_in, clock, reset, nickel_out, dispense);
    input nickel_in, dime_in, clock, reset;
    output reg nickel_out, dispense;

    reg [4:0] current_state, next_state;

    // State Definitions
    localparam S0 = 5'b00001, S5 = 5'b00010, S10 = 5'b00100, S15 = 5'b01000, S20 = 5'b10000;

    // State Transitions
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // State Logic
    always @(*) begin
        case (current_state)
            S0: if (nickel_in) next_state = S5; 
                else if (dime_in) next_state = S10; 
                else next_state = S0;
            S5: if (nickel_in) next_state = S10; 
                else if (dime_in) next_state = S15; 
                else next_state = S5;
            S10: if (nickel_in) next_state = S15; 
                else if (dime_in) next_state = S20; 
                else next_state = S10;
            S15: begin next_state = S0; dispense = 1; end
            S20: begin next_state = S0; dispense = 1; end
            default: next_state = S0;
        endcase
    end
endmodule

// Repeat similar structure for Item_Two, Item_Three, and Item_Four
// ...

// Main Vending Machine Module
module VendingMachine(item_number, nickel_in, dime_in, clock, reset, nickel_out, dispense);
    input [3:0] item_number;
    input nickel_in, dime_in, clock, reset;
    output reg nickel_out, dispense;

    wire nickel_out_1, nickel_out_2, nickel_out_3, nickel_out_4;
    wire dispense_1, dispense_2, dispense_3, dispense_4;

    // Instantiate item modules
    Item_One I1(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .reset(reset), .nickel_out(nickel_out_1), .dispense(dispense_1));
    // Item_Two I2(...);
    // Item_Three I3(...);
    // Item_Four I4(...);

    always @(*) begin
        case (item_number)
            4'b0001: begin nickel_out = nickel_out_1; dispense = dispense_1; end
            // Add cases for Item 2, 3, and 4
            default: begin nickel_out = 0; dispense = 0; end
        endcase
    end
endmodule
