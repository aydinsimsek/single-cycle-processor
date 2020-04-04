module Data_Memory(clk, MemWrite, A, WD, RD);

input clk, MemWrite; 
input [31:0] A, WD;
output reg [31:0] RD;   
 
integer i; 
reg [7:0] data_mem [255:0]; // data memory has 256 memory slots of 8 bits 

initial begin 
			data_mem[0] = 8'b0;
			data_mem[1] = 8'b0;
			data_mem[2] = 8'b0;
			data_mem[3] = 8'b0;	   
			data_mem[4] = 8'b1;
			data_mem[5] = 8'b0;
			data_mem[6] = 8'b0;
			data_mem[7] = 8'b0;		
			data_mem[8] = 8'b10;
			data_mem[9] = 8'b0;
			data_mem[10] = 8'b0;
			data_mem[11] = 8'b0;		
			data_mem[12] = 8'b11;
			data_mem[13] = 8'b0;
			data_mem[14] = 8'b0;
			data_mem[15] = 8'b0;	

			for (i=16; i<256; i=i+1) 
				begin 
				data_mem[i] = i;
				end
end


// data is written sequentially 
always @(posedge clk) 
begin 
	if (MemWrite) 
		{data_mem[A+3], data_mem[A+2], data_mem[A+1], data_mem[A]} <= WD;
end 

// data is read combinationally 
always @(A)
begin 
	RD = {data_mem[A+3], data_mem[A+2], data_mem[A+1], data_mem[A]}; 
end 
endmodule 