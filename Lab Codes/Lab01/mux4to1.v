module mux4to1(w,s,f);

input [3:0]w;
input [1:0]s;
output reg f;

always @(w,s)
	case(s)
		0: f=w[0];
		1: f=w[1];
		2: f=w[2];
		3: f=w[3];
		default: f=1'bx;
	endcase
endmodule