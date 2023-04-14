`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2023 05:13:17
// Design Name: 
// Module Name: Encoder
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


module Encoder
#(parameter INPUT_LEN = 648,
            OUTPUT_LEN = INPUT_LEN*3)
    (
    input bit input_data [INPUT_LEN],
    input bit reset,
    input bit clk,
    output bit output_data [OUTPUT_LEN] 
    );

bit [2:0] shift_reg_1;
bit [2:0] shift_reg_2;
bit [10:0] counter;
bit interleaved_input_data [INPUT_LEN];

always @ (posedge clk or posedge reset)
begin
    
    if(reset)
    begin
        shift_reg_1 [2:0] <= 3'b000;
        shift_reg_2 [2:0] <= 3'b000;
        counter [10:0] <= 11'b00000000000;
        interleaved_input_data[INPUT_LEN-1:0] <= input_data[0:INPUT_LEN-1];         //решил сделать перемежение реверсом, не знаю, можно ли так
        output_data <= '{default:0};
    end

    else
    begin
     //<= input_data[counter] ^ shift_reg_1[2] ^ shift_reg_1 [1];
    

    //counter <= counter + 1;
    end

end

endmodule

/*
module Interleaver
#(parameter INPUT_LEN = 644)

    (
    input bit [INPUT_LEN-1:0] input_data,
    input wire reset,
    input wire clk,
    output bit [INPUT_LEN-1:0] interleaved_data,
    );
interleaved_data = input_data.reverse();


endmodule
*/