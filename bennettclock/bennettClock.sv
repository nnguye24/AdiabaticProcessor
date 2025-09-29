module bennett_clock #(
    parameter integer PHASES = 4
) (
    input wire clk,
    input wire reset,
    output reg [PHASES-1:0] clkp,
    output reg Mclk,
    output reg instFlag
);

    // The total number of states in the sequence is 2*PHASES + 2
    localparam MAX_STATE = 2 * PHASES + 1;
    // Calculate the required width for the state register.
    localparam STATE_WIDTH = $clog2(MAX_STATE + 1);

    reg [STATE_WIDTH-1:0] state;
  
	// To generate Mclk
    always @(posedge clk) begin
      if (clkp[PHASES-2] == 1) begin
        Mclk <= 1;
      end else if (instFlag ==1) begin
        Mclk <= 0;
      end

    end
 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // On reset, initialize the state to 0.
            state <= 0;
        end else begin
            // Cycle through the states up to the calculated maximum.
            if (state == MAX_STATE)
                state <= 0;
            else
                state <= state + 1;
        end
    end
 						
    always @(*) begin
        integer i;
        // instFlag should only be high for one cycle when state is 0.
        // Set its default value to low.
        instFlag = 1'b0;
        if (state == 0) begin
            // State 0: All phases are low.
            clkp = '0;
            // Pulse the instruction flag high during this state.
            instFlag = 1'b1;
        end else if (state <= PHASES) begin
            // States 1 to PHASES: Rising edge sequence.
            for (i = 0; i < PHASES; i = i + 1) begin
                if (i < state - 1)
                    clkp[i] = 1'b1;
                else if (i == state - 1)
                    clkp[i] = 1'bx;
                else
                    clkp[i] = 1'b0;
            end
        end else if (state == PHASES + 1) begin
            // State (PHASES + 1): All phases are high.
            clkp = '1;
        end else begin // state > PHASES + 1
            // States (PHASES + 2) to MAX_STATE: Falling edge sequence.
            for (i = 0; i < PHASES; i = i + 1) begin
                 // Calculate the current step in the falling sequence.
                if (i < (MAX_STATE - state))
                    clkp[i] = 1'b1;
                else if (i == (MAX_STATE - state))
                    clkp[i] = 1'bx;
                else
                    clkp[i] = 1'b0;
            end
        end
    end

endmodule
