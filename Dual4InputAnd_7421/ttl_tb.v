// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------
module TTL_tb;
   reg A1,B1,C1, D1;
   wire Y1;

   initial begin
      $dumpfile("ttl_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      $monitor("%d %m: MONITOR - A1 = %d, B1 = %d, C1 = %d, D1 = %d, Y1 = %d", $stime, A1, B1, C1, D1, Y1);
      
      #10;
      
      A1 = 0; B1 = 0; C1 = 0; D1 = 0;
      #21;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #1 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 1; B1 = 0; C1 = 0; D1 = 0;
      #21;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #2 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 0; B1 = 1; C1 = 0; D1 = 0;
      #21;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #3 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 0; B1 = 0; C1 = 1; D1 = 0;
      #21;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #4 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 0; B1 = 0; C1 = 0; D1 = 1;
      #21;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #5 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 1; B1 = 1; C1 = 1; D1 = 1;
      #21;
      if (Y1 == 0) begin
         $display("%d %m: ERROR #6 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   // Instances
   TTL_7421 gate(.A1(A1), .B1(B1), .C1(C1), .D1(D1), .Y1(Y1), .A2(), .B2(), .C2(), .D2(), .Y2());

endmodule

