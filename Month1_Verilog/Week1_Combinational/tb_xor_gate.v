module tb_xor_gate;

reg a,b;

wire y;

xor_gate DUT(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("xor_gate.vcd");
    $dumpvars(0,tb_xor_gate);

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