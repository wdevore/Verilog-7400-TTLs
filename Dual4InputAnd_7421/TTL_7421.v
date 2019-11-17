
// Description:
// 74LS21 Dual 4 input AND module
//
`timescale 1ns/10ps

module TTL_7421 (
   input  A1, B1, C1, D1,    // Unit A
   output Y1,
   input  A2, B2, C2, D2,    // Unit B
   output Y2
   );

   assign #(0:8:15, 0:10:20) Y1 = A1 & B1 & C1 & D1;
   assign #(0:8:15, 0:10:20) Y2 = A2 & B2 & C2 & D2;
endmodule

