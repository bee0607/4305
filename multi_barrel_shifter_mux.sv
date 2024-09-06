`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 11:49:18 AM
// Design Name: 
// Module Name: multi_barrel_shifter_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module multi_barrel_shifter_mux #(parameter N = 3)
(
    input logic [(2**N)-1:0] a,
    input logic [N-1:0] amt,
    input logic lr,
    output logic [(2**N)-1:0] mux_out
    );
    
    //wires
    logic [(2**N)-1:0] y1,y2;
    
    
    param_right_shifter #(.N(N)) shift_right
    (
    .a(a),
    .amt(amt),
    .y(y1)
    );
    
    param_left_shifter #(.N(N)) shift_leftt
    (
    .a(a),
    .amt(amt),
    .y(y2)
    );
    
    always @(*) 
    begin
    mux_out = lr ? y1 : y2;
    end
endmodule

