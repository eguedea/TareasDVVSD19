module muxSalidas
import ControlRx_in::*; 
(
	input DataIn_t P0,P1,P2,P3,
	input DataIn_t size, 
	
	output DataIn_t P
	
);

always_comb begin 
	case(size)
		1:P = P0;
		2:P = P1;
		3:P = P2;
		4:P = P3;
		5:P = P0;
		6:P = P1;
		7:P = P2;
		8:P = P3;
		default: P = P0;
	endcase 
end 



endmodule 