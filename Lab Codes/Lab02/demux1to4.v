module demux1to4(w, s, f);

output reg [3:0] f; 
input [1:0] s; 
input w;

always @(w, s)
    case(s)
        2'b00 : begin 
					f[0] = w; 
					f[3:1] = 0; 
				end
        2'b01 : begin 
					f[1] = w; 
					f[0] = 0;   
				end
        2'b10 : begin 
					f[2] = w; 
					f[1:0] = 0; 
				end
        2'b11 : begin 
					f[3] = w; 
					f[2:0] = 0; 
				end
    endcase
endmodule