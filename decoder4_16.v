module decoder4_16(select0, select1, select2, select3, out0, out1, out2, out3,out4, out5, out6, out7,out8, out9, out10, out11, out12, out13, out14, out15);
	
input select0, select1, select2, select3;
output reg out0, out1, out2, out3,out4, out5, out6, out7,out8, out9, out10, out11, out12, out13, out14, out15;
	
always @(select0,select1,select2,select3)													
begin
	case ({select3, select2, select1, select0})												
		4'b0000: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000000001;
		4'b0001: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000000010;
		4'b0010: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000000100;
		4'b0011: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000001000;
		4'b0100: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000010000;
		4'b0101: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000100000;
		4'b0110: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000001000000;
		4'b0111: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000010000000;
		4'b1000: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000100000000;
		4'b1001: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000001000000000;
		4'b1010: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000010000000000;
		4'b1011: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000100000000000;
		4'b1100: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0001000000000000;
		4'b1101: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0010000000000000;
		4'b1110: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0100000000000000;
		4'b1111: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b1000000000000000;
		default: {out15, out14, out13, out12,out11, out10, out9, out8, out7, out6, out5, out4,out3, out2, out1, out0} = 16'b0000000000000000;
	endcase
end
endmodule 