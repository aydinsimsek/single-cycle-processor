module constant (out);
parameter WIDTH =32; 
parameter value =32'b100; 
output [WIDTH-1:0] out;
wire [WIDTH-1:0] out;
assign out = value;
endmodule 
