`timescale 1ps/1ps

module tb_mod_n;

reg clk, rst;
wire [3:0] count_mod6, count_mod12;

mod_n_counter #(.N(6)) MOD6(.clk (clk), .rst(rst), .count(count_mod6));
mod_n_counter #(.N(12)) MOD12(.clk (clk), .rst(rst), .count(count_mod12));    

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("mod.vcd");
    $dumpvars(0, tb_mod_n);

    rst = 1; #12;
    rst = 0;

    $display("Time | MOD6  MOD12");
    $diaplay("-------------------")

    repeat(15) begin
        #10;
        $display("%4t  |   %0d       %0d",$time, count_mod6, count_mod12);
    end  
end
endmodule