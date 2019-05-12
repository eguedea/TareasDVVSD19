module Division 
import Global::*;
(
// Input Ports
input clk,
input reset,
input load,
input ready,
input [DW-1:0] Dividendo,
input [DW-1:0] R_Suma,Wire_Qm, 

// Output Ports
output logic [DW-1:0] Cosiente,Residuo,
output logic [DW-1:0] A_Resta,
output logic Op_Aux_resta
);


logic OperacionAux;
logic [DW_2-1:0]Operacion,A;





always_ff@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
	begin
		OperacionAux <= 1'b0;
		//A1 <= 5'b0000;
		Operacion <= 8'b00000000;
	end
	else 
	begin
		if (load == 1'b0)
		begin
			Operacion <= {{DW{1'b0}},Dividendo};
		end
		else begin
			if (ready==0)begin
					OperacionAux <= 1'b1;
					Operacion <= A<<<1;		
			end else
				OperacionAux <= 1'b0;
		end
	end
end
assign Cosiente = A[DW-1:0];
assign Residuo = A[DW_2-1:DW];
assign A_Resta = Operacion[DW_2-1:DW];
assign Op_Aux_resta = OperacionAux;

Mux_Division Mux
(
	.A({Wire_Qm,Operacion[DW-1:1],1'b0}),
	.Suma(R_Suma),
	.Sel(Wire_Qm[DW-1]),
	.P(A)

);
endmodule


