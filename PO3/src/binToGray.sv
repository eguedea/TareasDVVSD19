module binToGray
import DataTypes::*;
(
input  ADDR_W bin,
output ADDR_W gray 
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