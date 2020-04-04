module Instruction_Memory(A, RD); 

input [31:0] A; 
output reg [31:0] RD; 
integer i;
reg [7:0] instr_mem [255:0]; // instruction memory has 256 memory slots of 8 bits 

initial begin   	

// Instruction format for memory instructions: cond(31:28)|op(27:26)|funct(25:20)|Rn(19:16)|Rd(15:12)|Src2(11:0) 
{instr_mem[3],instr_mem[2],instr_mem[1],instr_mem[0]} = 32'b1110_01_000001_0000_0000_000000000100; 	 // LDR R0,[R0,#4]   -- R0:1
{instr_mem[7],instr_mem[6],instr_mem[5],instr_mem[4]} = 32'b1110_01_000001_0001_0001_000000001000; 	 // LDR R1,[R1,#8]   -- R1:2
{instr_mem[11],instr_mem[10],instr_mem[9],instr_mem[8]} = 32'b1110_01_000001_0010_0010_000000001100; 	 // LDR R2,[R2,#12]   -- R2:3
// Instruction format for data-processing instructions with register Src2: cond(31:28)|op(27:26)|funct(25:20)|Rn(19:16)|Rd(15:12)|shamt5(11:7)|sh(6:5)|0|Rm(3:0) 
// Instruction format for data-processing instructions with immediate Src2: cond(31:28)|op(27:26)|funct(25:20)|Rn(19:16)|Rd(15:12)|rot(11:8)|imm8(7:0)
{instr_mem[15],instr_mem[14],instr_mem[13],instr_mem[12]} = 32'b1110_00_0_0100_0_0010_0011_00000_00_0_0001;  // ADD R3,R2,R1      -- R3:5
{instr_mem[19],instr_mem[18],instr_mem[17],instr_mem[16]} = 32'b1110_00_0_0010_0_0010_0011_00000_00_0_0001;  // SUB R3,R2,R1    -- R3:1
{instr_mem[23],instr_mem[22],instr_mem[21],instr_mem[20]} = 32'b1110_00_0_0000_0_0010_0011_00000_00_0_0001;  // AND R3,R2,R1    -- R3:2
{instr_mem[27],instr_mem[26],instr_mem[25],instr_mem[24]} = 32'b1110_00_0_1100_0_0010_0011_00000_00_0_0001;  // ORR R3,R2,R1  -- R3:3						
{instr_mem[31],instr_mem[30],instr_mem[29],instr_mem[28]} = 32'b1110_00_1_1000_0_0010_0001_0000_00000001;	//LSL R1,R2,#1   -- R1:6
{instr_mem[35],instr_mem[34],instr_mem[33],instr_mem[32]} = 32'b1110_00_1_0001_0_0010_0001_0000_00000001;	//LSR R1,R2,#1	   -- R1:1
{instr_mem[39],instr_mem[38],instr_mem[37],instr_mem[36]} = 32'b1110_00_0_1010_1_0000_0001_000000000010;	 // CMP R1,R0   
{instr_mem[43],instr_mem[42],instr_mem[41],instr_mem[40]} = 32'b1110_01_000000_0010_0001_000000000100; 	 // STR R1,[R2,#4]
{instr_mem[47],instr_mem[46],instr_mem[45],instr_mem[44]} = 32'b1110_01_000001_0010_0011_000000000100; 	 // LDR R3,[R2,#4]   -- R3:1


for(i=48; i<256; i=i+1)  
	 begin 
	 instr_mem[i] = i;
	 end 
end

always @(A)
begin 
RD = {instr_mem[A+3], instr_mem[A+2], instr_mem[A+1], instr_mem[A]}; // read 32 bits in Little Endian format     
end 
endmodule 