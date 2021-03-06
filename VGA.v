module VGA(C_R, C_G, C_B, CLOCK_50, VGA_R, VGA_G, VGA_B, VGA_CLK, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC, X, Y, DISP);
	parameter LEAD_X = 0, LEAD_Y = 0, V_FP = 10, V_SP = 2, V_BP = 33, V_VA = 480, H_FP = 16, H_SP = 96, H_BP = 48, H_VA = 640;// Set the width of the regions
	
	input CLOCK_50;
	input[7:0] C_R, C_G, C_B;
	output[7:0] VGA_R,VGA_G,VGA_B;
	output reg[9:0] X, Y;
	output reg VGA_HS, VGA_VS, DISP;
	output VGA_CLK, VGA_BLANK, VGA_SYNC;
	wire CLOCK_25;
	counter freqDivider(CLOCK_50, 1, 0, CLOCK_25,);
	assign VGA_CLK = CLOCK_25;
	
	assign VGA_BLANK = 0;// ~VGA_VS;
	assign VGA_SYNC = 0;
	
	reg[9:0] col, row, counterH, counterV;
	
	initial
		counterV <= V_FP + V_SP + V_BP - LEAD_Y;
	
	initial
		counterH <= H_FP + H_SP + H_BP - LEAD_X;
	
	reg BUF_HS, BUF_VS;
	
	muxN #(10) rsw(0,C_R, DISP, VGA_R);
	muxN #(10) gsw(0,C_G, DISP, VGA_G);
	muxN #(10) bsw(0,C_B, DISP, VGA_B);
	
	always @(posedge CLOCK_25) begin
		counterH = counterH + 10'b1;
		if(counterH > (H_FP + H_SP + H_BP + H_VA)) begin
			counterH = 0;
			counterV = counterV + 10'b1;
			if(counterV > (V_FP + V_SP + V_BP + V_VA))
				counterV = 0;
		end
		
		/*
			VSync and HSync timing
		*/
		VGA_VS <= BUF_VS;//The sync pulses are buffered because the onboard chip does so for everything else
		VGA_HS <= BUF_HS;
		if(counterH <= (H_FP + H_SP) && counterH > H_FP)//HSync after FP
			BUF_HS <= 1;
		else
			BUF_HS <= 0;
		
		if(counterV <= (V_FP + V_SP) && counterV > V_FP)//VSync is between the front porch and backporch
			BUF_VS = 1;
		else
			BUF_VS = 0;
		
		
		
		//RGB timing
		if(counterV > (V_FP + V_SP + V_BP - LEAD_Y) && counterH > (H_FP + H_SP + H_BP - LEAD_X)) begin
			DISP = 1;
			X[9:0] = counterH[9:0] + LEAD_X - (H_FP + H_SP + H_BP + 1);
			Y[9:0] = counterV[9:0] + LEAD_Y - (V_FP + V_SP + V_BP + 1);
		end
		else begin
			DISP = 0;
			X = 0;
			Y= 0;
		end
	end
	
endmodule

module counter(CLK, CLK_N, RES, z, cout);
	parameter SIZE = 1;
	input CLK, RES, CLK_N;
	output[SIZE-1:0] z;
	output cout;
	
	reg[SIZE-1:0] z;
	
	always @(posedge CLK or posedge RES)
	begin
		if (RES) begin
			z = 0;
		end
		else if (CLK_N) begin
			z = z + 1;
		end
	end
endmodule

module muxN(a,b,s,z);//Generic N bit 2 to 1 mux
	parameter SIZE = 1;
	input[SIZE-1:0] a,b;
	input s;
	output[SIZE-1:0] z;
	
	assign z = ({SIZE{~s}} & a) | ({SIZE{s}} & b);
	
endmodule

