module tb_nand_gate;
    reg a,b;
    wire y;

    nand_gate DUT(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("nand_gate.vcd");
        $dumpvars(0,tb_nand_gate);

        a=0;b=0;
        #10;
        $display("A=%d B=%d Y=%d",a,b,y);

        a=0;b=1;
        #10;
        $display("A=%d B=%d Y=%d",a,b,y);

        a=1;b=0;
        #10;
        $display("A=%d B=%d Y=%d",a,b,y);

        a=1;b=1;
        #10;
        $display("A=%d B=%d Y=%d",a,b,y);
    end
endmodule