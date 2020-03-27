module PC_Logic(Rd,RegW,PCS);
input [3:0] Rd; 
input RegW;  
output reg PCS; 

always @(Rd)
begin 
	if (Rd == 4'b1111 && RegW == 1) // if instruction writes to R15 then PCS is 1 else it's 0 
		PCS = 1; 
	else 
		PCS = 0; 
end 
endmodule 