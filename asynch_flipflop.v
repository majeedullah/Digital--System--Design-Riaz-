`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 02:31:02 PM
// Design Name: 
// Module Name: asynch_flipflop
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


module asynch_flipflop(q, d, clk, reset);
input d, clk, reset;
output reg q;

always @(posedge clk, reset)
begin
    if(reset == 1) 
    q <= 0;
    else 
    q<=d;
end

endmodule

module tb_flipflop();

reg clk, d, reset;
wire q;

asynch_flipflop inst0(q, d, clk, reset);
initial 
begin

#00 d =0; clk = 0; reset = 0;
#10 d=1; clk = 1; reset = 0;
#10 d=0; clk = 0; reset = 0;
#10 d=0; clk = 1; reset = 0;
#10 d=1; clk = 0; reset = 0;
#10 d=1; clk = 1; reset = 0;
#10 d=1; clk = 1; reset = 0;
#10 d=0; clk = 1; reset = 0;
#10 d=1; clk = 1; reset = 1;
#10 $stop;

end

endmodule

