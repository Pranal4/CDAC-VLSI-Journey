module tb_dff;

    reg  clk, rst, en, d;
    wire q_async, q_sync, q_enable;

    // Instantiate all three DUTs
    dff_async  DUT1 (.clk(clk), .rst(rst), .d(d), .q(q_async));
    dff_sync   DUT2 (.clk(clk), .rst(rst), .d(d), .q(q_sync));
    dff_enable DUT3 (.clk(clk), .rst(rst), .en(en), .d(d), .q(q_enable));

    // Clock generation — period = 10ns (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;   // toggle every 5ns

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_dff);
        $display("Time | clk rst en d | q_async q_sync q_enable");
        $display("--------------------------------------------------");

        // Initial reset
        rst = 1; en = 1; d = 0;
        #12;              // hold reset through one full cycle
        rst = 0;

        // Test 1: D changes, watch capture on clock edge
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;

        // Test 2: async reset mid-cycle
        d = 1; #3;        // set d mid-cycle
        rst = 1; #2;      // async DFF should reset IMMEDIATELY
                           // sync DFF should NOT reset yet
        #5;                // now clock edge happens with rst=1
        rst = 0; #5;

        // Test 3: enable behavior
        en = 0;            // disable dff_enable
        d = 1; #10;        // q_enable should NOT change
        d = 0; #10;        // q_enable should NOT change
        en = 1;            // re-enable
        d = 1; #10;        // now q_enable SHOULD capture

        $finish;
    end

    // Print every time any signal changes
    always @(posedge clk or posedge rst)
        $display("%40t | %b   %b   %b  %b |    %b       %b       %b",
                   $time, clk, rst, en, d, q_async, q_sync, q_enable);

endmodule