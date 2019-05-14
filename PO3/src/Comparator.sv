
module Comparator
import DataTypes::*;
(
//inputs
	input [ADDR_WIDTH-1:0] value,
	input [ADDR_WIDTH-1:0] compare_value,
//Outputs
	output bit_t compare_flag
);
//Variables a utilizar
bit_t flag=0;

always_comb begin
	if (compare_value == value)
		flag = 1'b1;
	else
		flag = 1'b0;
end 
//asignacion de salida
assign compare_flag = flag;

endmodule