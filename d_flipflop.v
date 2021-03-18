`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 01:23:07 PM
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(q0,q1,q2,q3, d, clk);

input clk, d;
output reg q0,q1,q2,q3;

always@(posedge clk)
begin
    q0<=d;
    q1<=q0;
    q2<=q1;
    q3<=q2;

 
end 

endmodule

module tb_flipflop();

reg clk, d;
wire q0,q1,q2,q3;

d_flipflop inst0(q0,q1,q2,q3, d, clk);
initial 
begin

#00 d =0; clk = 0;
#10 d=1; clk = 1;
#10 d=0; clk = 0;
#10 d=0; clk = 1;
#10 d=1; clk = 0;
#10 d=1; clk = 1;
#10 d=1; clk = 1;
#10 d=0; clk = 1;
#10 d=1; clk = 1;
#10 $stop;

end

endmodule

