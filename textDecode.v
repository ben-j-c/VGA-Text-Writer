module textDecode(charCode, pixelsExternal);
	input[7:0] charCode;
	
	output[63:0] pixelsExternal;
	reg[7:0] pixels[7:0];
	
	assign pixelsExternal[7:0] = pixels[0];
	assign pixelsExternal[15:8] = pixels[1];
	assign pixelsExternal[23:16] = pixels[2];
	assign pixelsExternal[31:24] = pixels[3];
	assign pixelsExternal[39:32] = pixels[4];
	assign pixelsExternal[47:40] = pixels[5];
	assign pixelsExternal[55:48] = pixels[6];
	assign pixelsExternal[63:56] = pixels[7];
	
	always @* begin
		case(charCode)
			 0: begin //null char
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			 end
			 1: begin //0
			 	pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000110;
				pixels[3] = 8'b10001010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10100010;
				pixels[6] = 8'b11000010;
				pixels[7] = 8'b01111100;
			 end
			 2: begin //1
			 	pixels[0] = 8'b00000000;
				pixels[1] = 8'b01110000;
				pixels[2] = 8'b01010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11111110;
			 end
			 3: begin//2
			 	pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b00000100;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00100000;
				pixels[7] = 8'b01111100;
			 end
			 4: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b00000010;
				pixels[3] = 8'b00000010;
				pixels[4] = 8'b00111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b11111100;
			 end
			 5: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10001000;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b11111110;
				pixels[5] = 8'b00001000;
				pixels[6] = 8'b00001000;
				pixels[7] = 8'b00001000;
			 end
			 6: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b11111100;
			 end
			 7: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 8: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000010;
				pixels[3] = 8'b00000100;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00100000;
				pixels[7] = 8'b01000000;
			 end
			 9: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 10: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b01111110;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b00000010;
			 end
			 11: begin //White char
				pixels[0] = 8'b11111111;
				pixels[1] = 8'b11111111;
				pixels[2] = 8'b11111111;
				pixels[3] = 8'b11111111;
				pixels[4] = 8'b11111111;
				pixels[5] = 8'b11111111;
				pixels[6] = 8'b11111111;
				pixels[7] = 8'b11111111;
			 end
			 12: begin //Chessboard char
				pixels[0] = 8'b10101010;
				pixels[1] = 8'b01010101;
				pixels[2] = 8'b10101010;
				pixels[3] = 8'b01010101;
				pixels[4] = 8'b10101010;
				pixels[5] = 8'b01010101;
				pixels[6] = 8'b10101010;
				pixels[7] = 8'b01010101;
			 end
			 65: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b10000100;
			 end
			 66: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11110000;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b11111000;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			 end
			 67: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b01111110;
			 end
			 68: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b10000100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			 end
			 69: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			 end
			 70: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			 end
			 71: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 72: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			 end
			 73: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11111110;
			 end
			 74: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00001000;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b10001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b01110000;
			 end
			 75: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10010000;
				pixels[2] = 8'b10100000;
				pixels[3] = 8'b11000000;
				pixels[4] = 8'b11000000;
				pixels[5] = 8'b10100000;
				pixels[6] = 8'b10010000;
				pixels[7] = 8'b10001000;
			 end
			 76: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			 end
			 77: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000110;
				pixels[3] = 8'b10101010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			 end
			 78: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000010;
				pixels[3] = 8'b10100010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b10000010;
			 end
			 79: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 80: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			 end
			 81: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b01111110;
			 end
			 82: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10011000;
				pixels[6] = 8'b10001100;
				pixels[7] = 8'b10000110;
			 end
			 83: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 84: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b00010000;
			 end
			 85: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b11111110;
			 end
			 86: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b00101000;
				pixels[7] = 8'b00010000;
			 end
			 87: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b01010100;
				pixels[6] = 8'b01010100;
				pixels[7] = 8'b00101000;
			 end
			 88: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b10000010;
			 end
			 89: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b10000000;
			 end
			 90: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000100;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11111110;
			 end
		endcase
	end
	
endmodule
