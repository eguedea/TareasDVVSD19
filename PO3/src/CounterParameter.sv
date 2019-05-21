`ifndef COUNTERPARAMETER
    `define COUNTERPARAMETER
	 
module CounterParameter	
#(
	parameter Maximum_Value = 434*7,
	parameter NBitsForCounter = CeilLog2(Maximum_Value)
)
(
	input clk,	//Clock 
	input reset,	//Activo en bajo	
	input enable,	//Activo en alto
	//input syncReset,	//Activo en alto
	output logic Flag,
	output [NBitsForCounter-1:0] Counting 
);

bit MaxValue_Bit;

logic [NBitsForCounter-1 : 0] Counting_logic;

	always_ff@(posedge clk or negedge reset) begin
		if (reset == 1'b0)
			Counting_logic <= 0;
		else begin
				if(enable == 1'b1) begin
					if(Counting_logic == Maximum_Value-1)
						Counting_logic <= 0;
					else
						Counting_logic <= Counting + 1'b1;
				end
				else
					Counting_logic <= 0;
		end
	end

//--------------------------------------------------------------------------------------------
always_comb
	if(Counting_logic == Maximum_Value-1)
		MaxValue_Bit = 1;
	else
		MaxValue_Bit = 0;
assign Flag = MaxValue_Bit;

assign Counting = Counting_logic;



function integer CeilLog2;
 input integer data;
 integer i,result;
	begin
      for(i=0; 2**i < data; i=i+1)
          result = i + 1;
          CeilLog2 = result;
		end
   
endfunction

   
endmodule 

`endif