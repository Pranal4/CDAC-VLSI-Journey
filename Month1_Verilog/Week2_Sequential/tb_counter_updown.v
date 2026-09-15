`timescale 1ps/1ps
module tb_counter_updown;

reg clk, rst, en, up_down;
wire [3:0] count;

counter_updown_4bit DUT(
    .clk(clk), .rst(rst), 
    .en(en), .up_down(up_down), .count(count)
);

initial clk = 0;
always #5 clk = ~clk;
    
initial begin
    $dumpfile("eud.vcd");
    $dumpvars(0, tb_counter_updown);

    $display("Time | en up_down | count");
    $display("---------------------------");

    rst=1; en=0; up_down =1; #12;
    rst = 0;

    en=1; up_down=1;
        repeat(5) begin
            #10;
            $display("%4t |  %b    %b     |  %0d", $time,en,up_down,count);
        end

        // Hold for 2 cycles (en=0)
        en=0;
        repeat(2) begin
            #10;
            $display("%4t |  %b    %b     |  %0d  (HOLD)", $time,en,up_down,count);
        end

        // Count down for 5 cycles
        en=1; up_down=0;
        repeat(5) begin
            #10;
            $display("%4t |  %b    %b     |  %0d", $time,en,up_down,count);
        end

        $finish;
end
    
endmodule