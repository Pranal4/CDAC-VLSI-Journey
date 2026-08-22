module tb_xnor_gate;

reg a,b;

wire y;

xnor_gate DUT(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("xnor_gate.vcd");
    $dumpvars(0,tb_xnor_gate);

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
    $finish;

end

endmodule