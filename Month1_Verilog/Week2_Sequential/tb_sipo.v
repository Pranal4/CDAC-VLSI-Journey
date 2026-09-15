`timescale 1ps/1ps
module tb_sipo;

reg clk, rst, si;
wire [3:0] po;

sipo_4bit DUT(.clk(clk), .rst(rst), .si(si), .po(po));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("sipo.vcd");
    $dumpvars(0, tb_sipo);
    $display("Loading 1011 serially, reading parallel each step:");
    $display("Time | si | po ");
    $display("---------------------------");

    rst=1; si=0; #12;
    rst=0;

    si=1; #10; $display("%4t |  %b |  %b  ", $time,si,po);
    si=0; #10; $display("%4t |  %b |  %b  ", $time,si,po);
    si=1; #10; $display("%4t |  %b |  %b  ", $time,si,po);
    si=1; #10; $display("%4t |  %b |  %b  ", $time,si,po);
    $finish;
end
    
endmodule