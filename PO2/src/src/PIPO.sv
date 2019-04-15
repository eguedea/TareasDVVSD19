//Nombre: PIPO
//Descripcion: un modulo de entrada paralela y salida paralela 
//Entrada: clk, rst, enb, inp
//Salida: out
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019

module PIPO
import Global::DW;
(
input               clk,
input               rst,
input               enb,
input    [DW-1:0]   inp,
output logic 	[DW-1:0]   out
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb)
        rgstr_r  <= inp;
end:rgstr_label

assign out  = rgstr_r;

endmodule
