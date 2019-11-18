// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------
module TTL_tb;
   reg A, B, C, D, E, F, G, H;
   wire Y;

   initial begin
      $dumpfile("ttl_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      $monitor("%d %m: MONITOR - A = %d, B = %d, C = %d, D = %d, E = %d, F = %d, G = %d, H = %d, Y = %d", $stime, A, B, C, D, E, F, G, H, Y);
      
      #10;
      
      A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #1 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 1; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #2 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 1; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #3 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 1; D = 0; E = 0; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #4 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 0; D = 1; E = 0; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #5 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 0; D = 0; E = 1; F = 0; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #6 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 0; D = 0; E = 0; F = 1; G = 0; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #7 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 1; H = 0;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #8 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 1;
      #23;
      if (Y == 0) begin
         $display("%d %m: ERROR #9 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; H = 1;
      #23;
      if (Y == 1) begin
         $display("%d %m: ERROR #10 - Status flags Y1 (%d) is not correct.", $stime, Y);
         $finish;
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   // Instances
   TTL_7430 gate(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H), .Y(Y));

endmodule

