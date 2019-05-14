module grayToBin
import DataTypes::*;
(
input ADDR_W gray,
output ADDR_W bin 
);

assign bin[ADDR_WIDTH-1] = gray[ADDR_WIDTH-1];
assign bin[ADDR_WIDTH-2] = gray[ADDR_WIDTH-1]^gray[ADDR_WIDTH-2];
assign bin[ADDR_WIDTH-3] = gray[ADDR_WIDTH-1]^gray[ADDR_WIDTH-2]^gray[ADDR_WIDTH-3];
assign bin[ADDR_WIDTH-4] = gray[ADDR_WIDTH-1]^gray[ADDR_WIDTH-2]^gray[ADDR_WIDTH-3]^gray[ADDR_WIDTH-4];
//genvar i;
//generate
//	for(i=0; i<ADDR_WIDTH; i=i+1)
//	begin: Bin_generate
//		assign bin[i] = ^gray[ADDR_WIDTH-1:i];
//	end
//endgenerate



endmodule


 