module muxAcomulador_P0
import ControlRx_in::*; 
(
	input DataIn_t N_Procesador,
	input DataIn_t Dato_In,
	
	
	output DataIn_t Dato_Out


);

always_comb begin 
	if(N_Procesador==0)
		Dato_Out = 0;
	else
		Dato_Out = Dato_In;
		
end 
endmodule 