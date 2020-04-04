module Shift_Register(in,shift_right_left,shift_amount,out);

input [31:0] in;
input [7:0] shift_amount; // shift amount will be get directly from the instruction (instr7:0) 
input shift_right_left; 
output reg [31:0] out; 

always @(in, shift_right_left, shift_amount) 
begin 
	if (shift_right_left == 1) 
		out = in >> shift_amount; //LSR operation 
	else 
		out = in << shift_amount; //LSL operation 
end 
endmodule 