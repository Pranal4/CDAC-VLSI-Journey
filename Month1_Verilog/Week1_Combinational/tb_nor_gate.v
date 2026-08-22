module tb_nor_gate;
    reg a,b;
    wire y;

    nor_gate DUT(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("nor_gate.vcd");
        $dumpvars(0,tb_nor_gate);

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