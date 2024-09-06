`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 11:52:11 AM
// Design Name: 
// Module Name: multi_barrel_shifter_reverser
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

    
    module multi_barrel_shifter_reverser #(parameter N = 3) 
        (
            input logic [(2**N)-1:0] a,
            input logic [N-1:0] amt,
            input logic lr,
            output logic [(2**N)-1:0] y 
        );
        //wires
        logic [(2**N)-1:0] mux1_output;
        logic [(2**N)-1:0] reversed1, reversed2, shifter_output;
        // First reverser chip input and output
        reverser CHIP1 (
                .a(a),
                .y(reversed1)
        );
        
        //2x1 mux
        always @(*)
                    begin
            mux1_output = lr ? a : reversed1;
        end
        
        //right shifter chip
        param_right_shifter SHIFTER_CHIP(
            .a(mux1_output),
            .amt(amt),
            .y(shifter_output)
        );
        
        // second reversse chip
        reverser CHIP2 (
            .a(shifter_output),
            .y(reversed2)
        );
        
        //second 2x1 mux for the output 
        always @(*)
                    begin
            y = lr ? shifter_output : reversed2;
        end
    endmodule
