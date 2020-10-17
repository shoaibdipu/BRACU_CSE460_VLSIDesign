module updowncounter(rst,clk,q,updown);
	input rst,clk,updown;
	output reg[3:0]q;
	
	always @(posedge clk)
		begin
			if(rst)
				q<=0;
			else
				if(updown)
					if(q==15)
						q<=0;
					else
						q<=q+1;
				else
					if(q==0)
						q<=15;
					else
						q<=q-1;
		end
endmodule