module universal_reg #(
parameter DW = 4
) (
input               clk,    // Clock
input               rst,    // asynchronous reset low active 
input               enb,    // Enable
input               l_s,    // load or shift
input  [DW-1:0]     inp,    // data input
input logic	  [2:0] reg_switch,
output logic 	[DW-1:0]	  out     // Serial output
);

logic [DW-1:0] rgstr_r;


always_ff@(posedge clk or negedge rst) begin: rgstr_label
	if(!rst)
        rgstr_r  <= '0;
	else if (enb) begin
		case(reg_switch)
			0: begin
					rgstr_r  <= inp;//PIPO
					out <= rgstr_r;
				end
			1: begin					//PISOM
				if (l_s)
					rgstr_r  <= inp;
				else begin
					rgstr_r  <= {rgstr_r[DW-2:0], rgstr_r[DW-1]};
				end
				out <= {{DW-1{1'b0}},rgstr_r[DW-1]};
				end
			2: begin					//PISOL
				if (l_s)
					rgstr_r  <= inp;
				else 
					rgstr_r  <= {rgstr_r[0],rgstr_r[DW-1:1]};
				out <= {{DW-1{1'b0}},rgstr_r[0]};
					end
			3: begin				//SIPOLM
				rgstr_r  <= {rgstr_r[DW-2:0], inp[0]};
				out <= rgstr_r;
					 end
			4:  begin 				//SIPOML
				rgstr_r  <= {inp[0],  rgstr_r[DW-1:1]};
				out <= rgstr_r;
					 end
			5: begin				//SISOL
				rgstr_r  <= {rgstr_r[DW-2:0], inp[0]};
				out <= {{DW-1{1'b0}},rgstr_r[DW-1]};
					 end
			6:   begin			//SISOR
				rgstr_r  <= {inp[0],  rgstr_r[DW-1:1]};
				out <= {{DW-1{1'b0}},rgstr_r[0]};
					 end
			default: rgstr_r <= '0;
		endcase 
	
	end

end: rgstr_label



endmodule