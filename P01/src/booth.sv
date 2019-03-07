module booth #(
parameter DW = 4
) (
	input				clk,
	input				rst,
	input				start,
	input logic [DW-1:0]	Q,
	input logic [DW-1:0] A,
	input logic [DW-1:0] M,
	input logic [1:0] Qm,
	input logic [DW-1:0] N,
	output logic			ready,
	output logic			ready_f,
	output logic [(DW*2):0] product,
	output logic [DW*2-1:0] f_product
);

logic [1:0] condition = '0;
logic [DW-1:0] Aop = '0;

always_ff@(posedge clk or negedge rst) begin
	if(!rst) begin
    product  <= '0;
	 end else begin
	condition <= Qm;
	case(condition)
	2'b00: begin
		product <= {A[DW-1],A,Q[DW-1:0]};
		if(N == '0) begin
		f_product <= product;
		ready <= '1;
		end
		end
	2'b01: begin
		Aop <= A+M;
		product <= {Aop[DW-1],Aop,Q[DW-1:0]};
		if(N == '0) begin
		f_product <= product;
		ready <= '1;
		end
		end
	2'b10: begin
		Aop<=A-M;
		product <= {Aop[DW-1],Aop,Q[DW-1:0]};
		if(N == '0) begin
		f_product <= product;
		ready <= '1;
		end
		end
	2'b11: begin
		product <= {A[DW-1],A,Q[DW-1:0]};
		if(N == '0) begin
		f_product <= product;
		ready <= '1;
		end
		end
		
	endcase
	end
	

end

	assign ready_f = ready;


endmodule