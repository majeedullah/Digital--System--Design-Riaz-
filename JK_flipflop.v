`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 03:16:42 PM
// Design Name: 
// Module Name: JK_flipflop
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

module JK_flipflop(q, j, k, en, clk, reset);
input j, k, en, clk, reset;
output reg q;

always @(posedge clk, reset)
begin
    if(reset == 1) 
        q <= 0;
    else if (en == 0)
        q<=q;
    else if ( j==0 && k == 0)
        q<=q;
    else if ( j==0 && k == 1)
        q<=0;
    else if ( j==1 && k == 0)
        q<=1;
    else if ( j==1 && k == 1)
        q<= ~ q;
    else 
        q<=q;
end

endmodule



















module JK_flipflop(q, t, en, clk, reset);
input t, en, clk, reset;
output reg q;

always @(posedge clk, reset)
begin
    if(reset == 1) 
        q <= 0;
    else if (en == 0)
        q<=q;
    else if ( t==0)
        q<=q;
    else if ( t==1)
        q<= ~ q;
    else 
        q<=q;
end

endmodule

