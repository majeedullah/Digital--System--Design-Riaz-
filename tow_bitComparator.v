`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 10:23:45 AM
// Design Name: 
// Module Name: tow_bitComparator
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


module tow_bitComparator(A_gt_B, A_lt_B, A_eq_B, A, B );

input[1:0] A, B;

output A_gt_B, A_lt_B, A_eq_B;

wire a0, a1, b0, b1;
wire [7:0] out;

not not1(a0, A[0]);
not not2(a1, A[1]);
not not3(b0, B[0]);
not not4(b1, B[1]);

//for A greater than B

and and1(out[0], A[1], b1);
and and2(out[1], A[0], b1, b0);
and and3(out[2], A[1], A[0],  b0);

or or1(A_gt_B, out[0], out[1], out[2]);

//for A less than B

and and4(out[3], a1, B[1]);
and and5(out[4], a0, B[1], B[0]);
and and6(out[5], a1, a0,  B[0]);

or or2(A_lt_B, out[3], out[4], out[5]);

//for A equal to B
xnor xnor1(out[6], A[0], B[0]);
xnor xnor2(out[7], A[1], B[1]);

and and7(A_eq_B, out[6], out[7]);



endmodule

module tb();

reg[1:0] A, B;

wire A_gt_B, A_lt_B, A_eq_B;

initial 
begin 

#00 {A[1], A[0], B[1], B[0]} = 4'b0000;
#10 {A[1], A[0], B[1], B[0]} = 4'b0001;
#10 {A[1], A[0], B[1], B[0]} = 4'b0010;
#10 {A[1], A[0], B[1], B[0]} = 4'b0011;
#10 {A[1], A[0], B[1], B[0]} = 4'b0100;
#10 {A[1], A[0], B[1], B[0]} = 4'b0101;
#10 {A[1], A[0], B[1], B[0]} = 4'b0110;
#10 {A[1], A[0], B[1], B[0]} = 4'b0111;
#10 {A[1], A[0], B[1], B[0]} = 4'b1000;
#10 {A[1], A[0], B[1], B[0]} = 4'b1001;
#10 {A[1], A[0], B[1], B[0]} = 4'b1010;
#10 {A[1], A[0], B[1], B[0]} = 4'b1011;
#10 {A[1], A[0], B[1], B[0]} = 4'b1100;
#10 {A[1], A[0], B[1], B[0]} = 4'b1101;
#10 {A[1], A[0], B[1], B[0]} = 4'b1110;
#10 {A[1], A[0], B[1], B[0]} = 4'b1111;

#10 $stop;
end

initial 

    $monitor($time, " ns -- { A1, A0} = %b, {B1, B0} = %b, A_lt_B = %b, A_eq_B = %b -- A_gt_B =%b", {A[1], A[0]}, {B[1], B[0]}, A_lt_B, A_eq_B, A_gt_B);
   // $monitor( $time, "ns  --{ A1, A0} = %b, {B1, B0} = %b, A_eq_B = %b, A_lt_B = %b -- A_gt_B = %b", {A[1], A[0]}, {B[1], B[0]} A_gt_B, A_lt_B, A_eq_B); 
    

tow_bitComparator inst0(A_gt_B, A_lt_B, A_eq_B, A, B );
 
endmodule