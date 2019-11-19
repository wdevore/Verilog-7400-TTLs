// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------
module TTL_tb;
   reg PRE1, CLR1,J1, K1;
   wire Q1, Q1N;

   // Simulation vars
   reg clk;
   integer i;
   reg t1, t1n;

   initial begin
      $dumpfile("ttl_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      $monitor("%d %m: MONITOR - PRE1 = %d, CLR1 = %d, clk = %d, J1 = %d, K1 = %d, Q1 = %d, Q1N = %d", $stime, PRE1, CLR1, clk, J1, K1, Q1, Q1N);
      clk = 0;

      // ------------------------------------------------------------------
      // Test clear
      // ------------------------------------------------------------------
      $display("Testing clear");
      PRE1 = 1; CLR1 = 0;
      J1 = 0; K1 = 0;
      #45;
      // We expect j=0/k=1
      if (Q1 != 1'b0 && Q1N != 1'b1) begin
         $display("%d %m: ERROR #1 - Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, Q1, Q1N);
         $finish;
      end
      // if (Q1 == 1 && Q1N == 0) begin
      //    $display("%d %m: ERROR #1 - Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, Q1, Q1N);
      //    $finish;
      // end

      // ------------------------------------------------------------------
      // Test preset
      // ------------------------------------------------------------------
      $display("Testing preset");
      PRE1 = 0; CLR1 = 1;
      J1 = 0; K1 = 0;
      #45;
      if (Q1 != 1'b1 && Q1N != 1'b0) begin
         $display("%d %m: ERROR #2 - Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, Q1, Q1N);
         $finish;
      end

      // ------------------------------------------------------------------
      // Test Hold (aka j=k=0)
      // ------------------------------------------------------------------
      $display("Testing hold");
      clk = 1;
      // First set values for j/k and clock them in.
      PRE1 = 1; CLR1 = 1;
      J1 = 0; K1 = 1;
      #10; // Adding simulated settling time for J/K prior to clock
      clk = ~clk;
      #45;
      // we expect j=0/k=1
      if (Q1 != 1'b0 && Q1N != 1'b1) begin
         $display("%d %m: ERROR #3 - Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, Q1, Q1N);
         $finish;
      end

      J1 = 0; K1 = 0;
      #10; // Adding simulated settling time for J/K prior to clock
      // Hold for 5 cycles
      for (i=0; i <= 10; i=i+1) begin
         clk = ~clk;
         #45;
         if (Q1 != 1'b0 && Q1N != 1'b1) begin
            $display("%d %m: ERROR #4 - At:<%d> Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, i, Q1, Q1N);
            $finish;
         end
      end

      // ------------------------------------------------------------------
      // Test Loading j=1/k=0
      // ------------------------------------------------------------------
      $display("Testing Load 1/0");
      J1 = 1; K1 = 0;
      #10; // Adding simulated settling time for J/K prior to clock
      clk = ~clk;
      #45;
      // we expect j=1/k=0
      if (Q1 != 1'b1 && Q1N != 1'b0) begin
         $display("%d %m: ERROR #5 - Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, Q1, Q1N);
         $finish;
      end

      J1 = 0; K1 = 0;  // now hold
      #10; // Adding simulated settling time for J/K prior to clock
      // Hold for 5 cycles
      for (i=0; i <= 10; i=i+1) begin
         clk = ~clk;
         #45;
         if (Q1 != 1'b1 && Q1N != 1'b0) begin
            $display("%d %m: ERROR #6 - At:<%d> Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, i, Q1, Q1N);
            $finish;
         end
      end

      // ------------------------------------------------------------------
      // Test Toggling j=1/k=1
      // ------------------------------------------------------------------
      $display("Testing toggle");

      clk = 1;
      J1 = 1; K1 = 1;
      #10; // Adding simulated settling time for J/K prior to clock

      // toggle for 5 cycles
      for (i=0; i <= 10; i=i+1) begin
         t1 = Q1; // Capture current state
         t1n = Q1N;
         clk = ~clk;
         #45;
         clk = ~clk;
         #45;
         // $display("Testing: (%d), (%d) : (%d), (%d)", t1, t1n, Q1, Q1N);
         if (Q1 == t1 && Q1N == t1n) begin
            $display("%d %m: ERROR #7 - At:[%d] Status flags Q1/Q1N (%d)/(%d) is not correct.", $stime, i, Q1, Q1N);
            $finish;
         end
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   // Instances
   TTL_7476 dut(
      .PRE1(PRE1), .CLR1(CLR1), .CLK1(clk), .J1(J1), .K1(K1), .Q1(Q1), .Q1N(Q1N),
      .PRE2(), .CLR2(), .CLK2(), .J2(), .K2(), .Q2(), .Q2N());

endmodule

