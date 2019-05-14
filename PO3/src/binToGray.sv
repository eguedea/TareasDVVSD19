module binToGray
import DataTypes::*;
(
input logic [ADDR_WIDTH-1:0] bin,
output logic [ADDR_WIDTH-1:0] gray 
);

assign gray[ADDR_WIDTH-1] = bin[ADDR_WIDTH-1];

genvar i;
generate
for(i = (ADDR_WIDTH-1); i>0; i = i-1)
	begin: gray_generator
		assign gray[i-1] = bin[i]^bin[i-1];
	end

endgenerate
endmodule