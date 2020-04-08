module register_2 (data,clk,rst,WriteEn,A);
parameter W = 32;  
input clk,rst,WriteEn;
input [W-1:0] data;
output reg [W-1:0] A;

always @ (posedge clk) 
begin 
if (rst) 
A <= 0; 
else if (~rst && WriteEn)  
A <= data;
else if (~rst && ~WriteEn)
A <= A; 
end 
endmodule  