module Extend(in,out);

input [11:0] in; 
output reg [31:0] out; 

always @(in) 
out = {20'b0, in}; //zero extend the immediate to 32 bits 

endmodule 

