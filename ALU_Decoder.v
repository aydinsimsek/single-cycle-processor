module ALU_Decoder(cmd,S,ALUOp,ALUControl,FlagW,NoWrite);
input [3:0] cmd; 	
input S, ALUOp; 
output reg [2:0] ALUControl; 
output reg [1:0] FlagW; 		
output reg NoWrite; 

always @(cmd,S,ALUOp)
begin
	if (ALUOp == 0) //if instruction is not a data-processing instruction
		begin 
		ALUControl = 3'b000; 
		FlagW = 2'b00; 
		NoWrite = 0; 
		end 
	else if (cmd == 4'b0100) // if it's ADD instruction 
		begin 
		ALUControl = 3'b000;
		NoWrite = 0; 
			if (S == 0)
				FlagW = 2'b00; // don't update flags 
			else 
				FlagW = 2'b11; // update N,Z,C,V flags 
		end 
	else if (cmd == 4'b0010) // if it's SUB instruction 
		begin 
		ALUControl = 3'b001;
		NoWrite = 0; 
			if (S == 0)
				FlagW = 2'b00; 
			else 
				FlagW = 2'b11; 
		end 
	else if (cmd == 4'b0000) // if it's AND instruction 
		begin 
		ALUControl = 3'b100;
		NoWrite = 0; 
			if (S == 0)
				FlagW = 2'b00; 
			else 
				FlagW = 2'b10; // update N,Z flags 
		end 
	else if (cmd == 4'b1100) // if it's ORR instruction 
		begin 
		ALUControl = 3'b101; 
		NoWrite = 0; 
			if (S == 0)
				FlagW = 2'b00; 
			else 								
				FlagW = 2'b10; 
		end 
	else if (cmd == 4'b1010) // if it's CMP instruction 
		begin 
		ALUControl = 3'b010; // to perform Rd-Rn for CMP Rd,Rn instruction 
		NoWrite = 1; 
		FlagW = 2'b11; 
		end 	
	else if (cmd == 4'b1000 || cmd == 4'b0001) // if it's LSL or LSR instruction 
		begin 
		NoWrite = 0; 
			if (S == 0)
				FlagW = 2'b00; 
			else 								
				FlagW = 2'b10; 
		end 
end 
endmodule 