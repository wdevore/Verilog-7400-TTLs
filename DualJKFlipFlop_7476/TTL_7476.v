
// Description:
// 74LS76A: Dual JK flipflop module
//
`timescale 1ns/10ps
// #(0:13:22, 0:8:15)
module jkff(input preset, input clear, input clk, input j, input k, output reg q, output qnot);
   // #(0:16:25, 0:25:40)
   assign qnot = ~q;

   always @(clear or preset) begin
      if (!clear) begin
         q <= #40 1'b0;
      end else if (!preset) begin
         q <= #40 1'b1;
      end
   end

   always @(negedge clk) begin
      case ({j, k})
         2'b00: q <= #40 q;
         2'b01: q <= #40 1'b0;
         2'b10: q <= #40 1'b1;
         2'b11: q <= #40 ~q;
      endcase
   end
endmodule

module TTL_7476 (
   input  PRE1, CLR1, CLK1, J1, K1,   // Unit A
   output Q1, Q1N,
   input  PRE2, CLR2, CLK2, J2, K2,   // Unit B
   output Q2, Q2N
   );

   jkff jkA (.preset(PRE1), .clear(CLR1), .clk(CLK1), .j(J1), .k(K1), .q(Q1), .qnot(Q1N));
   jkff jkB (.preset(PRE2), .clear(CLR2), .clk(CLK2), .j(J2), .k(K2), .q(Q2), .qnot(Q2N));

endmodule
