module main(
    input wire clk,
    input wire ButtonStart,
    input wire ButtonReset,
    input wire ButtonCount,
    input wire ButtonPause,
    input wire ButtonStop,
    output wire [6:0] segHundred,
    output wire [6:0] segTen,
    output wire [6:0] segUnit,
    output wire [6:0] segTenth
);

reg [31:0] Count = 0;
reg [3:0] Hundred = 0;
reg [3:0] Ten = 0;
reg [3:0] Unit = 0;
reg [3:0] Tenth = 0;
reg Active = 0;        // Flag to control the count
reg Display = 0;      // Flag to activate/deactivate the display

wire [2:0] State;
reg [2:0] State_prev;

Button button(
    .clk(clk),
    .ButtonStart(ButtonStart),
    .ButtonReset(ButtonReset),
    .ButtonCount(ButtonCount),
    .ButtonPause(ButtonPause),
    .ButtonStop(ButtonStop),
    .state(State)
);

always @(posedge clk) begin

	 
    if(ButtonStart == 1) begin
        case (State)
            3'b001: begin // RESET
                Count <= 0;
                Hundred <= 0;
                Ten <= 0;
                Unit <= 0;
                Tenth <= 0;
                Active <= 0;
                Display <= 1;
					 State_prev = State;
            end
            3'b010: begin // COUNT
                Active <= 1;
                Display <= 1;
					 State_prev = State;
            end
            3'b011: begin // PAUSE
					 if(State_prev == 3'b010) begin
						 Active <= 1;
						 Display <= 0;
						 State_prev = State;
					 end
            end
            3'b100: begin // STOP
                Active <= 0;
                Display <= 0;
					 State_prev = State;
            end
        endcase
    end else begin
			 Count <= 0;
          Hundred <= 0;
          Ten <= 0;
          Unit <= 0;
          Tenth <= 0;
          Active <= 0;
          Display <= 1;
	 end

    if (Active == 1) begin // Apenas conta se estiver no estado COUNT
        Count <= Count + 1;
        if (Count == 5000000) begin
            Count <= 0;
            Tenth <= Tenth + 1;
            if (Tenth == 9) begin
                Tenth <= 0;
                Unit <= Unit + 1;
                if (Unit == 9) begin
                    Unit <= 0;
                    Ten <= Ten + 1;
                    if (Ten == 9) begin
                        Ten <= 0;									
                        Hundred <= Hundred + 1;
								if(Hundred == 9) begin
									 Count <= 0;
                            Hundred <= 0;
                            Ten <= 0;
                            Unit <= 0;
                            Tenth <= 0;
                            Active <= 0;
								end
                    end
                end
            end
        end
    end
end

Display7 display(
    .Hundred(Hundred),
    .Ten(Ten),
    .Unit(Unit),
    .Tenth(Tenth),
    .segHundred(segHundred),
    .segTen(segTen),
    .segUnit(segUnit),
    .segTenth(segTenth),
    .displayActive(Display)
);

endmodule
