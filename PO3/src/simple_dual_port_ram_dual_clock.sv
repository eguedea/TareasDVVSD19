module simple_dual_port_ram_dual_clock
import DataTypes::*;
(
	input bit_t clk_w,
	input bit_t clk_r
	input bit_t en_w,
	input bit_t en_r,
	input DATA_W data,
	input ADDR_W read_addr, 
	input ADDR_W write_addr,
	output logic DATA_W ram_out;
);

	// Declare the RAM variable
	logic [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

	always_ff @ (posedge clk_w)
	begin
		if (en_w)
			ram[write_addr] <= data;
	
	always_ff@(posedge clk_r)
		if(en_r)
			ram_out <= ram[read_addr];
		
		ram_out <= ram[read_addr];
	end

endmodule
