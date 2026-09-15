`timescale 1ns/1ps

module tb_shift_reg_compare;

    reg  clk, rst, si, load;
    reg  [3:0] pi;
    wire so_siso, so_piso;
    wire [3:0] po_sipo, po_pipo;

    siso_4bit SISO (.clk(clk),.rst(rst),.si(si),.so(so_siso));
    sipo_4bit SIPO (.clk(clk),.rst(rst),.si(si),.po(po_sipo));
    piso_4bit PISO (.clk(clk),.rst(rst),.load(load),.pi(pi),.so(so_piso));
    pipo_4bit PIPO (.clk(clk),.rst(rst),.load(load),.pi(pi),.po(po_pipo));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time | SISO_out | SIPO_out | PISO_out | PIPO_out");
        $display("----------------------------------------------------");

        rst=1; si=0; load=0; pi=4'b0000; #12;
        rst=0;

        // Feed serial data to SISO/SIPO, parallel data to PISO/PIPO
        si=1; pi=4'b1100; load=1; #10;
        $display("%4t |    %b     |   %b    |    %b     |   %b",
                   $time,so_siso,po_sipo,so_piso,po_pipo);

        si=0; load=0; #10;
        $display("%4t |    %b     |   %b    |    %b     |   %b",
                   $time,so_siso,po_sipo,so_piso,po_pipo);

        si=1; #10;
        $display("%4t |    %b     |   %b    |    %b     |   %b",
                   $time,so_siso,po_sipo,so_piso,po_pipo);

        si=1; #10;
        $display("%4t |    %b     |   %b    |    %b     |   %b",
                   $time,so_siso,po_sipo,so_piso,po_pipo);

        $finish;
    end

endmodule