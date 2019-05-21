module sipo 
import UART_pkg::*; 
(
input               clk,
input               rst,
input               enb,
input 		One_t	  CounFin,
input       One_t   inp,
output 	   int8_t  out
);

sipo_t sipo;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        sipo.rgstr_r  <= '0;
    else 
	 begin
		if(CounFin)
			sipo.rgstr_r  <= sipo.rgstr_r;
		else 
		if (enb)
			sipo.rgstr_r  <= {inp,sipo.rgstr_r[DW-1:1]};
	end
	
end:rgstr_label

assign out  = sipo.rgstr_r;

//TODO: try to design a SIPO register where the serial input is connected to the MSB bit and shifting is to the right
endmodule
