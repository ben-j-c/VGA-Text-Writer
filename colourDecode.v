module colourDecode(input[7:0] char, output reg[7:0] FG_RED, FG_GREEN, FG_BLUE, BG_RED, BG_GREEN, BG_BLUE);
	always @(*) begin
		case(char[3:0])
			0: begin 
				FG_RED = 8'h00;
				FG_GREEN = 8'h00;
				FG_BLUE = 8'h00;
			end
			1: begin 
				FG_RED = 8'h00;
				FG_GREEN = 8'h00;
				FG_BLUE = 8'hAA;
			end
			2: begin 
				FG_RED = 8'h00;
				FG_GREEN = 8'hAA;
				FG_BLUE = 8'h00;
			end
			3: begin 
				FG_RED = 8'h00;
				FG_GREEN = 8'hAA;
				FG_BLUE = 8'hAA;
			end
			4: begin 
				FG_RED = 8'hAA;
				FG_GREEN = 8'h00;
				FG_BLUE = 8'h00;
			end
			5: begin 
				FG_RED = 8'hAA;
				FG_GREEN = 8'h00;
				FG_BLUE = 8'hAA;
			end
			6: begin 
				FG_RED = 8'hAA;
				FG_GREEN = 8'h55;
				FG_BLUE = 8'h00;
			end
			7: begin 
				FG_RED = 8'hAA;
				FG_GREEN = 8'hAA;
				FG_BLUE = 8'hAA;
			end
			8: begin 
				FG_RED = 8'h55;
				FG_GREEN = 8'h55;
				FG_BLUE = 8'h55;
			end
			9: begin 
				FG_RED = 8'h55;
				FG_GREEN = 8'h55;
				FG_BLUE = 8'hFF;
			end
			10: begin 
				FG_RED = 8'h55;
				FG_GREEN = 8'hFF;
				FG_BLUE = 8'h55;
			end
			11: begin 
				FG_RED = 8'h55;
				FG_GREEN = 8'hFF;
				FG_BLUE = 8'hFF;
			end
			12: begin 
				FG_RED = 8'hFF;
				FG_GREEN = 8'h55;
				FG_BLUE = 8'h55;
			end
			13: begin 
				FG_RED = 8'hFF;
				FG_GREEN = 8'h55;
				FG_BLUE = 8'hFF;
			end
			14: begin 
				FG_RED = 8'hFF;
				FG_GREEN = 8'hFF;
				FG_BLUE = 8'h00;
			end
			15: begin 
				FG_RED = 8'hFF;
				FG_GREEN = 8'hFF;
				FG_BLUE = 8'hFF;
			end
		endcase
	end	
	always @(*) begin
		case(char[7:4])
			0: begin 
				BG_RED = 8'h00;
				BG_GREEN = 8'h00;
				BG_BLUE = 8'h00;
			end
			1: begin 
				BG_RED = 8'h00;
				BG_GREEN = 8'h00;
				BG_BLUE = 8'hAA;
			end
			2: begin 
				BG_RED = 8'h00;
				BG_GREEN = 8'hAA;
				BG_BLUE = 8'h00;
			end
			3: begin 
				BG_RED = 8'h00;
				BG_GREEN = 8'hAA;
				BG_BLUE = 8'hAA;
			end
			4: begin 
				BG_RED = 8'hAA;
				BG_GREEN = 8'h00;
				BG_BLUE = 8'h00;
			end
			5: begin 
				BG_RED = 8'hAA;
				BG_GREEN = 8'h00;
				BG_BLUE = 8'hAA;
			end
			6: begin 
				BG_RED = 8'hAA;
				BG_GREEN = 8'h55;
				BG_BLUE = 8'h00;
			end
			7: begin 
				BG_RED = 8'hAA;
				BG_GREEN = 8'hAA;
				BG_BLUE = 8'hAA;
			end
			8: begin 
				BG_RED = 8'h55;
				BG_GREEN = 8'h55;
				BG_BLUE = 8'h55;
			end
			9: begin 
				BG_RED = 8'h55;
				BG_GREEN = 8'h55;
				BG_BLUE = 8'hFF;
			end
			10: begin 
				BG_RED = 8'h55;
				BG_GREEN = 8'hFF;
				BG_BLUE = 8'h55;
			end
			11: begin 
				BG_RED = 8'h55;
				BG_GREEN = 8'hFF;
				BG_BLUE = 8'hFF;
			end
			12: begin 
				BG_RED = 8'hFF;
				BG_GREEN = 8'h55;
				BG_BLUE = 8'h55;
			end
			13: begin 
				BG_RED = 8'hFF;
				BG_GREEN = 8'h55;
				BG_BLUE = 8'hFF;
			end
			14: begin 
				BG_RED = 8'hFF;
				BG_GREEN = 8'hFF;
				BG_BLUE = 8'h00;
			end
			15: begin 
				BG_RED = 8'hFF;
				BG_GREEN = 8'hFF;
				BG_BLUE = 8'hFF;
			end
		endcase
	end
endmodule
