`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 04:44:52 PM
// Design Name: 
// Module Name: PriorityEncoder
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


module PriorityEncoder( q, d);

input [7:0] d;
output  [2:0] q;

//always@(d)
//begin
//    casex(d)
//    8'b00000001 : q = 3'b000;
//    8'b0000001x : q = 3'b001;
//    8'b000001xx : q = 3'b010;
//    8'b00001xxx : q = 3'b011;
//    8'b0001xxxx : q = 3'b100;
//    8'b001xxxxx : q = 3'b101;
//    8'b01xxxxxx : q = 3'b110;
//    8'b1xxxxxxx : q = 3'b111;
//    default: q = 3'bxxx;
    
//    endcase
//end

//endmodule
assign q[0] = d[1] || d[3] || d[5] || d[7];
assign q[1] = d[2] || d[3] || d[6] || d[7];
assign q[2] = d[4] || d[5] || d[6] || d[7];

endmodule 
