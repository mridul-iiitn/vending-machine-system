// Vending Machine FSM for Multiple Items
// Each item has a specific price, and the machine accepts rupee_five and rupee_ten as input.

// Module for the first item
module Item_One(rupee_five_in, rupee_ten_in, clock, reset, rupee_five_out, dispense);
    // Inputs and Outputs
    input rupee_five_in, rupee_ten_in, clock, reset;
    output reg rupee_five_out, dispense;
    reg [4:0] current_state, next_state;

    // State Encoding
    localparam  S0  = 5'b00001,  // Initial state
                S5  = 5'b00010,  // 5 cents collected
                S10 = 5'b00100,  // 10 cents collected
                S15 = 5'b01000,  // 15 cents collected
                S20 = 5'b10000;  // 20 cents collected

    // State Transition on Clock or Reset
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            current_state <= S0; // Reset to initial state
        end else begin
            current_state <= next_state;
        end
    end

    // Next State Logic and Output Assignments
    always @(rupee_five_in or rupee_ten_in) begin
        case (current_state)
            S0: // From initial state
                if (rupee_five_in)      begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
                else if (rupee_ten_in)   begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S0;  {rupee_five_out, dispense} = 2'b00; end

            S5: // From 5 cents collected
                if (rupee_five_in)      begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else if (rupee_ten_in)   begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end

            S10: // From 10 cents collected
               if (rupee_five_in)      begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
               else if (rupee_ten_in)   begin next_state = S20; {rupee_five_out, dispense} = 2'b01; end
               else               begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end

            S15: // Dispense the item and reset
              if(rupee_five_in)       begin next_state= S20; {rupee_five_out,dispense}= 2'b01; end
              else if (rupee_ten_in)   begin next_state = S0; {rupee_five_out, dispense} = 2'b11; end
               else               begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
          
            S20: // Dispense the item and reset
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end

            default: // Default to initial state
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end
        endcase
    end
endmodule

// Module for the second item
module Item_Two(rupee_five_in, rupee_ten_in, clock, reset, rupee_five_out, dispense);
    input rupee_five_in, rupee_ten_in, clock, reset;
    output reg rupee_five_out, dispense;

    reg [5:0] current_state, next_state;
    localparam  S0  = 6'b000001,  // Initial state
                S5  = 6'b000010,  // 5 cents collected
                S10 = 6'b000100,  // 10 cents collected
                S15 = 6'b001000,  // 15 cents collected
                S20 = 6'b010000,  // 20 cents collected
                S25 = 6'b100000;  // 25 cents collected

    // State Transition on Clock or Reset
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            current_state <= S0; // Reset to initial state
        end else begin
            current_state <= next_state;
        end
    end

    // Next State Logic and Output Assignments
    always @(rupee_five_in or rupee_ten_in) begin
        case (current_state)
            S0: // From initial state
                if (rupee_five_in)      begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
                else if (rupee_ten_in)   begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S0;  {rupee_five_out, dispense} = 2'b00; end

            S5: // From 5 cents collected
                if (rupee_five_in)      begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else if (rupee_ten_in)   begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end

            S10: // From 10 cents collected
                if (rupee_five_in)      begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else if (rupee_ten_in)   begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end

            S15: // From 15 cents collected
               if (rupee_five_in)      begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
               else if (rupee_ten_in)   begin next_state = S25; {rupee_five_out, dispense} = 2'b01; end
               else               begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end

            S20: // Dispense the item and reset
              if (rupee_five_in)      begin next_state = S25; {rupee_five_out, dispense} = 2'b01; end
              else if (rupee_ten_in)   begin next_state = S0; {rupee_five_out, dispense} = 2'b11; end
              else               begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end


            S25: // Dispense the item and reset
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end

            default: // Default to initial state
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end
        endcase
    end
endmodule

// Module for the third item
module Item_Three(rupee_five_in, rupee_ten_in, clock, reset, rupee_five_out, dispense);
    input rupee_five_in, rupee_ten_in, clock, reset;
    output reg rupee_five_out, dispense;
    
    reg [6:0] current_state, next_state;
    localparam  S0  = 7'b0000001,
                S5  = 7'b0000010,
                S10 = 7'b0000100,
                S15 = 7'b0001000,
                S20 = 7'b0010000,
                S25 = 7'b0100000,
                S30 = 7'b1000000;
    
    always @(posedge clock or reset) begin
        if(reset) begin
            current_state <= S0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(rupee_five_in or rupee_ten_in) begin
        case(current_state)
            S0: 
                if(rupee_five_in)      begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S0;  {rupee_five_out, dispense} = 2'b00; end
            
            S5: 
                if(rupee_five_in)      begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
            
            S10:
              if(rupee_five_in)      begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
            
            S15:
                if(rupee_five_in)      begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
            
            S20:
                if(rupee_five_in)      begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S30; {rupee_five_out, dispense} = 2'b01; end
                else               begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
            
            S25:
                if(rupee_five_in)      begin next_state = S30; {rupee_five_out, dispense} = 2'b01; end
                else if(rupee_ten_in)   begin next_state = S0; {rupee_five_out, dispense} = 2'b11; end
                else               begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
            
            S30:
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end

            default:
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end
            endcase
    end
endmodule

// Module for the fourth item
module Item_Four(rupee_five_in, rupee_ten_in, clock, reset, rupee_five_out, dispense);
    input rupee_five_in, rupee_ten_in, clock, reset;
    output reg rupee_five_out, dispense;
    
    reg [7:0] current_state, next_state;
    localparam  S0  = 8'b00000001,
                S5  = 8'b00000010,
                S10 = 8'b00000100,
                S15 = 8'b00001000,
                S20 = 8'b00010000,
                S25 = 8'b00100000,
                S30 = 8'b01000000,
                S35 = 8'b10000000;
    
    always @(posedge clock or reset) begin
        if(reset) begin
            current_state <= S0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(rupee_five_in or rupee_ten_in) begin
        case(current_state)
            S0: 
                if(rupee_five_in)      begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S0;  {rupee_five_out, dispense} = 2'b00; end
            
            S5: 
                if(rupee_five_in)      begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S5;  {rupee_five_out, dispense} = 2'b00; end
            
            S10:
                if(rupee_five_in)      begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S10; {rupee_five_out, dispense} = 2'b00; end
            
            S15:
                if(rupee_five_in)      begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S15; {rupee_five_out, dispense} = 2'b00; end
            
            S20:
                if(rupee_five_in)      begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S30; {rupee_five_out, dispense} = 2'b00; end
                else               begin next_state = S20; {rupee_five_out, dispense} = 2'b00; end
            
            S25:
                if(rupee_five_in)      begin next_state = S30; {rupee_five_out, dispense} = 2'b00; end
                else if(rupee_ten_in)   begin next_state = S35; {rupee_five_out, dispense} = 2'b01; end
                else               begin next_state = S25; {rupee_five_out, dispense} = 2'b00; end
            
            S30:
              if(rupee_five_in)      begin next_state = S35; {rupee_five_out, dispense} = 2'b01; end
              else if(rupee_ten_in)   begin next_state = S0; {rupee_five_out, dispense} = 2'b11; end
              else               begin next_state = S30; {rupee_five_out, dispense} = 2'b00; end

            S35:
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end

            default:
                begin next_state = S0; {rupee_five_out, dispense} = 2'b00; end
            endcase
    end
endmodule

// Main Vending Machine Module
module VendingMachine(item_number, rupee_five_in, rupee_ten_in, clock, reset, rupee_five_out, dispense);
    // Inputs and Outputs
    input [3:0] item_number;
    input rupee_five_in, rupee_ten_in, clock, reset;
    output reg rupee_five_out, dispense;

    // Internal Signals
    wire No1, No2, No3, No4, D1, D2, D3, D4;

    // Instantiating Modules for Each Item
    Item_One   IO (.rupee_five_in(rupee_five_in), .rupee_ten_in(rupee_ten_in), .clock(clock), .reset(reset), .rupee_five_out(No1), .dispense(D1));
    Item_Two   ITW(.rupee_five_in(rupee_five_in), .rupee_ten_in(rupee_ten_in), .clock(clock), .reset(reset), .rupee_five_out(No2), .dispense(D2));
    Item_Three ITH(.rupee_five_in(rupee_five_in), .rupee_ten_in(rupee_ten_in), .clock(clock), .reset(reset), .rupee_five_out(No3), .dispense(D3));
    Item_Four  IF (.rupee_five_in(rupee_five_in), .rupee_ten_in(rupee_ten_in), .clock(clock), .reset(reset), .rupee_five_out(No4), .dispense(D4));

    // Selecting Outputs Based on Item Number
    always @(*) begin
        case (item_number)
            4'b0001: begin
                rupee_five_out = No1;
                dispense = D1;
            end
            4'b0010: begin
                rupee_five_out = No2;
                dispense = D2;
            end
            4'b0100: begin
                rupee_five_out = No3;
                dispense = D3;
            end
            4'b1000: begin
                rupee_five_out = No4;
                dispense = D4;
            end
            default: begin
                rupee_five_out = 0;
                dispense = 0;
            end
        endcase
    end
endmodule
