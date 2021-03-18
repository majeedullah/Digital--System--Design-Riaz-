`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 03:02:30 PM
// Design Name: 
// Module Name: SR_flipflop
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


module SR_flipflop(q, s, r, en, clk, reset);
input s, r, en, clk, reset;
output reg q;

always @(posedge clk, reset)
begin
    if(reset == 1) 
        q <= 0;
    else if (en == 0)
        q<=q;
    else if ( s==0 && r ==0)
        q<=q;
    else if ( s==0 && r ==1)
        q<=0;
    else if ( s==1 && r ==0)
        q<=1;
    else if ( s==1 && r ==1)
        q<=1'bx;
    else 
        q<=q;
end

endmodule

module tb_sr_flipflop();

reg s, r, en, clk, reset;
wire q;

SR_flipflop inst0(q, s, r, en, clk, reset);
initial 
begin

#00 {s, r} =1'b00; clk = 0; reset = 0; en = 0;
#10 {s, r} =1'b00; clk = 0; reset = 0; en = 1;
#10 {s, r} =1'b01; clk = 1; reset = 0; en = 1;
#10 {s, r} =1'b01; clk = 1; reset = 0; en = 0;
#10 {s, r} =1'b10; clk = 0; reset = 0; en = 1;
#10 {s, r} =1'b10; clk = 1; reset = 0; en = 0;
#10 {s, r} =1'b11; clk = 1; reset = 0; en = 1;
//#10 d=1; clk = 0; reset = 0;
//#10 d=1; clk = 1; reset = 0;
//#10 d=1; clk = 1; reset = 0;
//#10 d=0; clk = 1; reset = 0;
//#10 d=1; clk = 1; reset = 1;
#10 $stop;

end

endmodule

