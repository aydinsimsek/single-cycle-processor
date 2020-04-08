module Conditional_Logic(Cond, ALUFlags, FlagW, PCS, RegW, MemW, NoWrite, clk, PCSrc, RegWrite, MemWrite);
input [3:0] Cond, ALUFlags; 
input [1:0] FlagW; 
input PCS, RegW, MemW, NoWrite, clk; 
output wire PCSrc, RegWrite, MemWrite; 

wire [1:0] FlagWrite, NZ_flags, CV_flags; 
reg CondEx; 

assign FlagWrite[0] = FlagW[0] & CondEx; 
assign FlagWrite[1] = FlagW[1] & CondEx; 

Register_with_WriteEn #(2) NZ_flags_register(ALUFlags[3:2], clk, 0, FlagWrite[1], NZ_flags[1:0]);
Register_with_WriteEn #(2) CV_flags_register(ALUFlags[1:0], clk, 0, FlagWrite[0], CV_flags[1:0]);

assign PCSrc = PCS & CondEx; 
assign MemWrite = MemW & CondEx; 
assign RegWrite = (~NoWrite & RegW) & CondEx;
 
always @(Cond, NZ_flags, CV_flags) 
begin
	if (Cond == 4'b1110) // if condition is "unconditional" then CondEx is 1 
		CondEx = 1; 	
	else if (Cond == 4'b0000 && NZ_flags[0] == 1) // if condition is "equal" and Z flag is 1 then CondEx is 1  
		CondEx = 1;
	else if (Cond == 4'b0001 && NZ_flags[0] == 0) // if condition is "not equal" and Z flag is 0 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b0010 && CV_flags[1] == 1) // if condition is "carry set" and C flag is 1 then CondEx is 1  	
		CondEx = 1; 	
	else if (Cond == 4'b0011 && CV_flags[1] == 0) // if condition is "carry clear" and C flag is 0 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b0100 && NZ_flags[1] == 1) // if condition is "minus" and N flag is 1 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b0101 && NZ_flags[1] == 0) // if condition is "plus" and N flag is 0 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b0110 && CV_flags[0] == 1) // if condition is "overflow" and V flag is 1 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b0111 && CV_flags[0] == 0) // if condition is "no overflow" and V flag is 0 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b1000 && (NZ_flags[0] == 0 && CV_flags[1] == 1)) // if condition is "unsigned higher" and Z flag is 0 and C flag is 1 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b1001 && (NZ_flags[0] == 1 || CV_flags[1] == 0)) // if condition is "unsigned lower or same" and Z flag is 1 or C flag is 0 then CondEx is 1  	
		CondEx = 1; 
	else if (Cond == 4'b1010 && (NZ_flags[1] == CV_flags[0])) // if condition is "signed greater than or equal" and N flag is equal to V flag then CondEx is 1  	
		CondEx = 1;
	else if (Cond == 4'b1011 && (NZ_flags[1] != CV_flags[0])) // if condition is "signed less than" and N flag is not equal to V flag then CondEx is 1  	
		CondEx = 1;	
	else if (Cond == 4'b1100 && ((NZ_flags[1] == CV_flags[0]) && NZ_flags[0] == 0)) // if condition is "signed greater than" and N flag is equal to V flag and Z flag is 0 then CondEx is 1  	
		CondEx = 1;
	else if (Cond == 4'b1101 && ((NZ_flags[1] != CV_flags[0]) || NZ_flags[0] == 1)) // if condition is "signed less than or equal" and N flag is not equal to V flag or Z flag is 1 then CondEx is 1  	
		CondEx = 1;
	else 
		CondEx = 0; 
end 
endmodule 