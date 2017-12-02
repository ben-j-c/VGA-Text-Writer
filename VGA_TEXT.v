module VGA_TEXT(
	SW, KEY,
	CLOCK_50,
	VGA_R, VGA_G, VGA_B, VGA_CLK, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC,
	LEDR, HEX0, HEX1,HEX2,HEX3,HEX4,HEX5);
	
	input CLOCK_50;
	input[9:0] SW;
	input[3:0] KEY;
	wire[3:0] keys;
	assign keys = ~KEY;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
	
	//VGA
	wire[7:0] C_R;
	wire[7:0] C_B;
	wire[7:0] C_G;
	wire[7:0] FG_RED,FG_GREEN,FG_BLUE, BG_RED, BG_GREEN, BG_BLUE;
	wire[9:0] X, Y;
	output wire[7:0] VGA_R,VGA_G,VGA_B;
	output VGA_HS, VGA_VS;
	output VGA_CLK, VGA_BLANK, VGA_SYNC;//VGA_BLANK and VGA_SYNC are not used
	
	wire VGA_CLK_internal, DISP;
	assign VGA_CLK = VGA_CLK_internal;
	
	//Link the vga controller to the internal colour chanels and the external VGA connections
	VGA(C_R, C_G, C_B,CLOCK_50, VGA_R, VGA_G, VGA_B, VGA_CLK_internal, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC, X, Y, DISP);

	//END OF VGA
	//MEMORY AND DECODING
	reg[7:0] writeChar;//writeChar is the char at cursorPos in textPage
	wire[12:0] readIdx;
	wire[11:0] pixels[7:0];
	wire[63:0] pixelLine;
	
	wire[12:0] addr, cursorPos;
	wire[7:0] qChar, cChar;//current char in textPage
	muxN #(13) addressSwitch(cursorPos,readIdx,DISP,addr);//When displaying, read from readIdx
	cursor(SW[9], keys[1], cursorPos);//keep track of where cursorPos would be
	
	textDecode(qChar, pixelLine);//Text font
	textPage text(addr, SW[7:0], CLOCK_50, (~DISP)&keys[0], qChar);//character memory
	
	colourDecode(cChar, FG_RED, FG_GREEN, FG_BLUE, BG_RED, BG_GREEN, BG_BLUE);
	textPage colour(addr, SW[7:0], CLOCK_50, (~DISP)&keys[2], cChar);//colour memory
	
	assign LEDR[7:0] = writeChar;
	
	decoder(cursorPos[3:0], HEX0);
	decoder(cursorPos[7:4], HEX1);
	decoder(cursorPos[11:8], HEX2);
	decoder({1'b0,1'b0,1'b0,cursorPos[12:12]}, HEX3);
	decoder(0, HEX4);
	decoder(0, HEX5);
	
	assign pixels[0] = pixelLine[7:0];
	assign pixels[1] = pixelLine[15:8];
	assign pixels[2] = pixelLine[23:16];
	assign pixels[3] = pixelLine[31:24];
	assign pixels[4] = pixelLine[39:32];
	assign pixels[5] = pixelLine[47:40];
	assign pixels[6] = pixelLine[55:48];
	assign pixels[7] = pixelLine[63:56];
	//END OF MEMORY AND DECODING
	//CONTROL SIGNALS
	
	addrConversion(X[9:3],Y[9:3],readIdx);//map the grid address to a linear address
	
	
	wire pixelOn;
	assign pixelOn = pixels[Y[2:0]][7-X[2:0]];
	
	muxN #(8) (BG_RED, FG_RED, pixelOn, C_R);
	muxN #(8) (BG_GREEN, FG_GREEN, pixelOn, C_G);
	muxN #(8) (BG_BLUE, FG_BLUE, pixelOn, C_B);
	
	always @(posedge CLOCK_50) begin
		if(~DISP) begin
			writeChar <= qChar;
		end
	end
	
endmodule

module decoder(bcd, hex);
	input[3:0] bcd;
	reg[6:0] z;
	output[6:0]hex;
	
	assign hex = ~z;
	
	always @* case (bcd)//lookup table
		4'b0000 :z = 7'b0111111;
		4'b0001 :z = 7'b0000110;
		4'b0010 :z = 7'b1011011; 
		4'b0011 :z = 7'b1001111;
		4'b0100 :z = 7'b1100110;
		4'b0101 :z = 7'b1101101;  
		4'b0110 :z = 7'b1111101;
		4'b0111 :z = 7'b0000111;
		4'b1000 :z = 7'b1111111;
		4'b1001 :z = 7'b1100111;
		4'b1010 :z = 7'b1110111; 
		4'b1011 :z = 7'b1111100;
		4'b1100 :z = 7'b0111001;
		4'b1101 :z = 7'b1011110;
		4'b1110 :z = 7'b1111001;
		4'b1111 :z = 7'b1110001;
	endcase
endmodule

module addrConversion(input[6:0] X,Y, output reg[12:0] addr);
	always @(*)
		addr = (80*Y)+X;
endmodule

module cursor(input up, clk, output reg[12:0] value);
	initial
		value <= 0;
	always @(posedge clk)begin		
		if(up)
			value <= value + 1;
		else
			value <= value - 1;
	end
endmodule

