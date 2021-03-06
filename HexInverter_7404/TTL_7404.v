
// Description:
// 74LS04 / 74LS14 Hex Inverter module
//
`timescale 1ns/10ps

module TTL_7404 (
   input  A1,    // Unit A
   output Y1,
   input  A2,    // Unit B
   output Y2,
   input  A3,    // Unit C
   output Y3,
   input  A4,    // Unit D
   output Y4,
   input  A5,    // Unit E
   output Y5,
   input  A6,    // Unit F
   output Y6
   );

   not #(0:9:15, 0:10:15) (Y1, A1);
   not #(0:9:15, 0:10:15) (Y2, A2);
   not #(0:9:15, 0:10:15) (Y3, A3);
   not #(0:9:15, 0:10:15) (Y4, A4);
   not #(0:9:15, 0:10:15) (Y5, A5);
   not #(0:9:15, 0:10:15) (Y6, A6);
endmodule

