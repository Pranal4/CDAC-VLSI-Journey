`timescale 1ns/1ps

module tb_bcd_counter;

    reg  clk, rst;
    wire [3:0] count;

    bcd_counter DUT (.clk(clk), .rst(rst), .count(count));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("bcd.vcd");
        $dumpvars(0, tb_bcd_counter);
        rst=1; #12;
        rst=0;

        $display("Watching BCD counter wrap at 9->0:");
        repeat(15) begin
            #10;
            $display("count = %0d", count);
        end

        $finish;
    end

endmodule