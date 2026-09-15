`timescale 1ps/1ps
module tb_counter_up;

reg clk, rst;
wire [3:0] count;

counter_up_4bit DUT(.clk(clk), .rst(rst), .count(count));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_counter_up);

    $display("Time  |  Count");
    $display("---------------");

    rst = 1; #12;
    rst = 0;

    repeat (18) begin
        #10;
        $display(" %4t  |   %0d ",$time, count);
    end
    $finish;
end
    
endmodule