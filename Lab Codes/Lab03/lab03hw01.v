module lab03hw01(Clock, Resetn, w1, w2, z);
	input Clock, Resetn, w1, w2;
	output reg z;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	assign k = w1^w2;
	
	always @(k,y)
		case (y)
			A: if (k) 
					begin
						Y = A; 
						z = 0;
				    end
			   else 
					begin
						Y = B; 
						z = 0;
					end
			
			B: if (k) 
					begin
						Y = A; 
						z = 0;
					end
			    else 
					begin
						Y = C; 
						z = 0;
					end
						
			C: if (k) 
					begin
						Y = A; 
						z = 0;
					end
				else 
					begin
						Y = D; 
						z = 0;
				end
				
			D: if (k) 
					begin
						Y = A; 
						z = 0;
					end
				else 
					begin
						Y = D; 
						z = 1;
					end
		endcase
		
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0) y <= A;
		else y <= Y;
		
endmodule
