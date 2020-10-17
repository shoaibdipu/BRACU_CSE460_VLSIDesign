module decoder2to4(w,y);

input [1:0]w;
output reg[3:0]y;

always @(w)
	casex (w)
		2'd0: y=4'b0001;
		2'd1: y=4'b0010;
		2'd2: y=4'b0100;
		2'd3: y=4'b1000;
		default: y=4'b0000;
	endcase
endmodule