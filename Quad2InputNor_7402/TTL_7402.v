
// Description:
// 74LS02 Quad Nor module
//
`timescale 1ns/10ps

module TTL_7402 (
   input  A1, B1,     // Unit A
   output Y1,
   input  A2, B2,     // Unit B
   output Y2,
   input  A3, B3,     // Unit C
   output Y3,
   input  A4, B4,     // Unit D
   output Y4
   );

   not #(0:10:15, 0:10:15) (Y1, A1 | B1);
   not #(0:10:15, 0:10:15) (Y2, A2 | B2);
   not #(0:10:15, 0:10:15) (Y3, A3 | B3);
   not #(0:10:15, 0:10:15) (Y4, A4 | B4);
endmodule

