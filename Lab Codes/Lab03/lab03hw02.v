module lab03hw02(Clock, Resetn, w, z);
	input Clock, Resetn, w;
	output z;
	reg [2:1] y,Y;
	parameter [2:1] S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
	
	always @(w, y)
		case (y)
			S0 : if (w) Y = S3;
				 else Y = S2;
		    S1 : if (w) Y = S0;
				 else Y = S1;
			S2 : if (w) Y = S0;
				 else Y = S3;
			S3 : if (w) Y = S1;
				 else Y = S1;
		endcase
		
	
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0) y <= S0;
		else y <= Y;
		
	assign z = (y == S3);
	
endmodule