
// Description:
// 74LS08 Quad AND module
//
`timescale 1ns/10ps

module TTL_7408 (
   input  A1, B1,     // Unit A
   output Y1,
   input  A2, B2,     // Unit B
   output Y2,
   input  A3, B3,     // Unit C
   output Y3,
   input  A4, B4,     // Unit D
   output Y4
   );

   and #(0:8:15, 0:10:20) (Y1, A1, B1);
   and #(0:8:15, 0:10:20) (Y2, A2, B2);
   and #(0:8:15, 0:10:20) (Y3, A3, B3);
   and #(0:8:15, 0:10:20) (Y4, A4, B4);
endmodule

