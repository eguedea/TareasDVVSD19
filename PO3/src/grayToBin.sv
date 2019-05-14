module grayToBin
import DataTypes::*;
(
input logic [ADDR_WIDTH-1:0] gray,
output logic [ADDR_WIDTH-1:0] bin 
);

assign bin[ADDR_WIDTH-1] = gray[ADDR_WIDTH-1];

genvar i;
generate
	for(i=0; i<ADDR_WIDTH; i=i+1)
	begin: Bin_generate
		assign bin[i] = ^gray[ADDR_WIDTH-1:i];
	end
endgenerate
endmodule


 