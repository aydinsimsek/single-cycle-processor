module Main_Decoder(Funct,Op,RegW,MemW,MemtoReg,ALUSrc,RegSrc,ALUOp,shift_right_left);

input [5:0] Funct; 
input [1:0] Op; 
output reg [1:0] MemtoReg; 
output reg RegW, MemW, RegSrc, ALUSrc, ALUOp, shift_right_left; 

always @(Funct,Op)
begin 
	if (Op == 2'b00) // if it's a data-processing instruction 
		begin 
			if (Funct[5] == 0 && (Funct[4:1] == 4'b0100 || Funct[4:1] == 4'b0010 || Funct[4:1] == 4'b0000 || Funct[4:1] == 4'b1100))
			// if it's ADD or SUB or AND or ORR instruction 
				begin 
				MemtoReg = 2'b00; 
				MemW = 0; 
				ALUSrc = 0; 
				RegW = 1;
				RegSrc = 0; 
				ALUOp = 1; 
				end 
			else if (Funct[5] == 1 && Funct[4:1] == 4'b1000) // if it's LSL instruction 
				begin 
				MemtoReg = 2'b01; 
				MemW = 0;  
				RegW = 1; 
				ALUOp = 1; 
				shift_right_left = 0; 
				end 
			else if (Funct[5] == 1 && Funct[4:1] == 4'b0001) // if it's LSR instruction
				begin 
				MemtoReg = 2'b01; 
				MemW = 0;  
				RegW = 1;    
				ALUOp = 1; 
				shift_right_left = 1; 			 
				end 
			else if (Funct[5] == 0 && Funct[4:1] == 4'b1010) // if it's CMP instruction 
				begin 
				MemW = 0; 
				ALUSrc = 0; 
				RegW = 0; 
				RegSrc = 1;   
				ALUOp = 1; 
				end 
		end 
	else if (Op == 2'b01) // if it's a memory instruction 
		begin 
			if (Funct[0] == 1) // if it's LDR instruction 
				begin
				MemtoReg = 2'b11;  
				MemW = 0; 
				ALUSrc = 1; 
				RegW = 1;  
				ALUOp = 0; 
				end 
			else if (Funct[0] == 0) // if it's STR instruction 
				begin 
				MemW = 1; 
				ALUSrc = 1; 
				RegW = 0; 
				RegSrc = 1; 
				ALUOp = 0; 
				end 
		end 									
end 
endmodule 