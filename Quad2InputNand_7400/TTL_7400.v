
// Description:
// 7400 Quad Nand module
//
`timescale 1ns/10ps

module TTL_7400 (
   input  A1, B1,     // Unit 1
   output Y1,
   input  A2, B2,     // Unit 2
   output Y2,
   input  A3, B3,     // Unit 3
   output Y3,
   input  A4, B4,     // Unit 4
   output Y4
   );

   // 15ns rise and fall
   not #(15) (Y1, A1 & B1);
   not #(15) (Y2, A2 & B2);
   not #(15) (Y3, A3 & B3);
   not #(15) (Y4, A4 & B4);
endmodule

