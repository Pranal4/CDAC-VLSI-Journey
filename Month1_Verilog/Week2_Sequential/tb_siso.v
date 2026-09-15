`timescale 1ps/1ps
module tb_siso;

reg clk, rst, si;
wire so;

siso_4bit DUT(.clk(clk), .rst(rst), .si(si), .so(so));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, tb_siso);
    $display("Sending serial data: 1,0,1,1 (one bit per clock)");
    $display("Time | si | so | shift_reg");
    $display("---------------------------");

    rst=1; si=0; #12;
    rst=0;

    si=1; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);
    si=0; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);
    si=1; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);
    si=1; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);
    si=0; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);
    si=0; #10; $display("%4t |  %b |  %b  | %b", $time,si,so,DUT.shift_reg);

    $finish;
end
    
endmodule