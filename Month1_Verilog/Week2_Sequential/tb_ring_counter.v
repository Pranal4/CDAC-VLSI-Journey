`timescale 1ps/1ps

module tb_ring_counter;

wire [3:0]q;
reg clk, rst;

ring_counter DUT(.q(q), .clk(clk), .rst(rst));

initial clk = 0;
always #5 clk = ~clk;

integer i;

initial begin
    $dumpfile("ring_c.vcd");
    $dumpvars(0, tb_ring_counter);

    $display("Ring Counter — watching for exactly 4 states:");
    $display(" Time |  q    | decimal");
    $display("----------------------");

    rst=1; #12;
    rst = 0;

    for (i = 0 ; i < 8 ; i = i + 1 ) begin
        #10;
        $display("%4t  |  %b  |  %0d", $time, q, q);
    end
    $finish;
end
endmodule