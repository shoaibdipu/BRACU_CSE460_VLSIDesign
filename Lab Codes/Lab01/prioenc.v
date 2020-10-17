module prioenc(w,y);

input [3:0]w;
output reg[1:0]y;

always @(w)
	casex (w)
		4'b1xxx: y=3;
		4'b0x1x: y=1;
		4'b0x01: y=0;
		4'b0100: y=2;
	endcase
endmodule