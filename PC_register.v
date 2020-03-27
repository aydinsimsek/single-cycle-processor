module PC_register(clk, PC_prime, PC); 
input clk; 
input [31:0] PC_prime; 
output reg [31:0] PC; 

always @(posedge clk)
PC = PC_prime; 

endmodule  