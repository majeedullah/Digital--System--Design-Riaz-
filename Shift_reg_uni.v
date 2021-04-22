`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 01:39:44 PM
// Design Name: 
// Module Name: Shift_reg_uni
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 01:01:53 PM
// Design Name: 
// Module Name: uni_shift_reg
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


module universal_shift_register(q, d, clk, ctrl, reset);

parameter N =8;
   
input wire clk, reset;
input wire [1:0] ctrl;
input wire [N-1:0] d;
output wire [N-1:0] q;

reg [N-1:0] r_reg, r_next;

always @(posedge clk, posedge reset)
    if (reset)
        r_reg <= 0;
    else
        r_reg <= r_next;
always @ (*)
    case(ctrl)
        2'b00: r_next = r_reg;
        2'b01: r_next = {r_reg[N-2:0], d[0]};
        2'b10: r_next = {d[N-1], r_reg[N-1:1]};
        default: r_next = d;
        
    endcase
    
assign q = r_reg;
    

endmodule



module uni_shift_reg_TB;
parameter N = 8;
reg clk , reset;
reg [1:0] ctrl;
reg [N-1:0] d;
wire [N-1:0] q; 

// instantiate 
universal_shift_register inst0(q, d, clk, ctrl, reset);

// clk generation
initial
clk = 0;
always 
#10 clk = ~ clk;  


// reset
initial
begin
    reset = 0;
    #10 reset = 1;

// un-reset and test the functionality
    @(negedge clk) reset = 0;

// SIPO, left shifting
    @(negedge clk); ctrl = 2'b01; d[0] = 1'b1;
    repeat(8) @(negedge clk); 

// SIPO, right shifting
    reset = 1; 
    @(negedge clk); reset = 0; ctrl = 2'b10; d[7] = 1'b1;
    repeat(8) @(negedge clk);  
    
// PIPO        
    reset = 1;
    @(negedge clk); reset = 0; ctrl = 2'b11; d = 8'b1010_1101;
    @(negedge clk); $stop;
     
end

endmodule
