module addersubtractor(S, Cout, A, B, Cin, V);
   input [3:0]A,B;
   input Cin; 
   
   output [3:0]S;   
   output 	Cout;   
   output V;
   
   wire [3:1]C; 
   wire [3:0]BX; 

   assign BX[0] = B[0] ^ Cin;
   assign BX[1] = B[1] ^ Cin;
   assign BX[2] = B[2] ^ Cin;
   assign BX[3] = B[3] ^ Cin;   
   assign V = C[3] ^ Cout;
   
   // Cout <- |FA4| <- C3 <- |FA3|<- C2 <- |FA2| <- C1 <- |FA1| <- Cin
      
   fulladd stage0 (S[0], C[1], A[0], BX[0], Cin);   
   fulladd stage1 (S[1], C[2], A[1], BX[1], C[1]);
   fulladd stage2 (S[2], C[3], A[2], BX[2], C[2]);  
   fulladd stage3 (S[3], Cout, A[3], BX[3], C[3]); 
   
endmodule 

module fulladd(S, Cout, A, B, Cin);
   input  A, B, Cin;
   output S, Cout;
   
   assign S = A ^ B ^ Cin;
   assign Cout = (A & B) | (Cin & (A ^ B));
   
endmodule