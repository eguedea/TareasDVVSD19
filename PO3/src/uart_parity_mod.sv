module uart_parity_mod
import DataTypes::*;
(
	input uint8_t data,
	output bit_t parity
);

assign parity = (data[0]^data[1]^data[2]^data[3]^data[4]^data[5]^data[6]^data[7]) ^ usingEvenParity;

endmodule		