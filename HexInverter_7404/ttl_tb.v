// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------
module TTL_tb;
   reg A1;
   wire Y1;

   initial begin
      $dumpfile("ttl_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      $monitor("%d %m: MONITOR - A1 = %d, Y1 = %d", $stime, A1, Y1);
      
      #10;
      
      A1 = 0;
      #16;
      if (Y1 == 0) begin
         $display("%d %m: ERROR #1 - Status flags Y1 (%d) is not correct for A1 (%d).", $stime, Y1, A1);
         $finish;
      end

      #16;

      A1 = 1;
      #16;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #2 - Status flags Y1 (%d) is not correct for A1 (%d).", $stime, Y1, A1);
         $finish;
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   // Instances
   TTL_7404 gate(.A1(A1), .Y1(Y1), .A2(), .Y2(), .A3(), .Y3(), .A4(), .Y4(), .A5(), .Y5(), .A6(), .Y6());

endmodule

