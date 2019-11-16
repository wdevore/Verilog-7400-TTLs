// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------
module TTL_7400_tb;
   reg A1,B1,A2,B2,A3,B3,A4,B4;
   wire Y1,Y2,Y3,Y4;

   initial begin
      $dumpfile("ttl_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      $monitor("%d %m: MONITOR - A1 = %d, B1 = %d, Y1 = %d", $stime, A1, B1, Y1);
      
      #10;
      
      A1 = 0; B1 = 0;
      #16;
      if (Y1 == 0) begin
         $display("%d %m: ERROR #1 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 1; B1 = 0;
      #16;
      if (Y1 == 0) begin
         $display("%d %m: ERROR #2 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 0; B1 = 1;
      #16;
      if (Y1 == 0) begin
         $display("%d %m: ERROR #3 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      A1 = 1; B1 = 1;
      #16;
      if (Y1 == 1) begin
         $display("%d %m: ERROR #4 - Status flags Y1 (%d) is not correct for A1 (%d) and B1 (%d).", $stime, Y1, A1, B1);
         $finish;
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   // Instances
   TTL_7400 gate(.A1(A1), .B1(B1), .Y1(Y1), .A2(A2), .B2(B2), .Y2(Y2), .A3(A3), .B3(B3), .Y3(Y3), .A4(A4), .B4(B4), .Y4(Y4));

endmodule

