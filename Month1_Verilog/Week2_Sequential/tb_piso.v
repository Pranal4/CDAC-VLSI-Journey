`timescale 1ns/1ps

module tb_piso;

    reg  clk, rst, load;
    reg  [3:0] pi;
    wire so;

    piso_4bit DUT (.clk(clk), .rst(rst), .load(load), .pi(pi), .so(so));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Load 1101 in parallel, then shift out serially:");
        $display("Time | load | shift_reg | so");
        $display("----------------------------");

        rst=1; load=0; pi=4'b0000; #12;
        rst=0;

        // LOAD phase — one clock cycle
        pi = 4'b1101;
        load = 1;
        #10;
        $display("%4t |  %b   |  %b   | %b  (LOADED)",
                   $time,load,DUT.shift_reg,so);

        // SHIFT phase — 4 clock cycles to shift all bits out
        load = 0;
        #10; $display("%4t |  %b   |  %b   | %b", $time,load,DUT.shift_reg,so);
        #10; $display("%4t |  %b   |  %b   | %b", $time,load,DUT.shift_reg,so);
        #10; $display("%4t |  %b   |  %b   | %b", $time,load,DUT.shift_reg,so);
        #10; $display("%4t |  %b   |  %b   | %b", $time,load,DUT.shift_reg,so);

        $finish;
    end

endmodule