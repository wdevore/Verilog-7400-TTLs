
// Description:
// 74LS30 8 input NAND module
//
`timescale 1ns/10ps

module TTL_7430 (
   input  A, B, C, D, E, F, G, H,   // Unit A
   output Y
   );

   not #(0:13:22, 0:8:15) (Y, A & B & C & D & E & F & G & H);
endmodule

