`timescale 1ns/1ps
module tb_jk_t;

reg clk, rst, j, k, t;
wire q_jk_direct, q_jk_fromdff;
wire q_t_direct, q_t_fromdff;

jk_ff DUT1(.clk(clk), .rst(rst), .j(j), .k(k), .q(q_jk_direct));
t_ff DUT2(.clk(clk), .rst(rst), .t(t), .q(q_t_direct));

jk_from_dff DUT3 (.clk(clk), .rst(rst), .j(j), .k(k), .q(q_jk_fromdff));
t_from_dff DUT4 (.clk(clk), .rst(rst), .t(t), .q(q_t_fromdff));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_jk_t);

    $display("Time | j k t | JK_direct JK_fromDFF | T_direct T_fromDFF");
    $display("---------------------------------------------------------");

    rst=1;j=0;k=0;t=0; #12;
    rst=0;

    // Test JK: Set (J=1,K=0)
        j=1; k=0; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        // Test JK: Hold (J=0,K=0)
        j=0; k=0; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        // Test JK: Toggle (J=1,K=1) — do this 3 times
        j=1; k=1; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (toggle1)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (toggle2)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (toggle3)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        // Test JK: Reset (J=0,K=1)
        j=0; k=1; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (reset)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        // Now test T flip-flop separately
        j=0; k=0;
        t=1; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (T toggle1)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (T toggle2)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        t=0; #10;
        $display("%4t |%b %b %b|     %b          %b     |    %b        %b  (T hold)",
                   $time,j,k,t,q_jk_direct,q_jk_fromdff,q_t_direct,q_t_fromdff);

        $finish;
    end

endmodule