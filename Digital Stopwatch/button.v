module button(
    input wire clk,
    input wire ButtonStart,
    input wire ButtonReset,
    input wire ButtonCount,
    input wire ButtonPause,
    input wire ButtonStop,
    output reg [2:0] state
);

    // STATES
    /*
     3'b001 = RESET
     3'b010 = COUNT
     3'b011 = PAUSE
     3'b100 = STOP
     */

    reg [2:0] StateValue;
	 initial begin
        StateValue <= 3'b001;
        state <= 3'b001;
        ButtonReset_prev <= 0;
        ButtonCount_prev <= 0;
        ButtonPause_prev <= 0;
        ButtonStop_prev <= 0;
    end
    
    // Recording previous button states
    reg ButtonReset_prev, ButtonCount_prev, ButtonPause_prev, ButtonStop_prev;

    always @(posedge clk) begin
		 if(ButtonStart == 1) begin
			  // ButtonReset rising edge detection
			  if (ButtonReset && !ButtonReset_prev) begin
					StateValue <= 3'b001;
			  end
			  // ButtonCount rising edge detection
			  else if (ButtonCount && !ButtonCount_prev) begin
					StateValue <= 3'b010;
			  end
			  // ButtonPause rising edge detection
			  else if (ButtonPause && !ButtonPause_prev) begin
					StateValue <= 3'b011;
			  end
			  // ButtonStop rising edge detection
			  else if (ButtonStop && !ButtonStop_prev) begin
					StateValue <= 3'b100;
			  end
			  
			  // Updating the previous button states
			  ButtonReset_prev <= ButtonReset;
			  ButtonCount_prev <= ButtonCount;
			  ButtonPause_prev <= ButtonPause;
			  ButtonStop_prev <= ButtonStop;
			  
			  // Updating the current state
			  state <= StateValue;
	    end else begin
				StateValue <= 3'b001;
				state <= StateValue;
			end
    end
endmodule
