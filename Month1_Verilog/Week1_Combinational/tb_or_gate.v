module tb_or_gate;

reg a,b;

wire y;

or_gate DUT(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("or_gate.vcd");
    $dumpvars(0,tb_or_gate);

    a=0;b=0;
    #10;
    $display("A=%d B=%d y=%d",a,b,y);

    a=0;b=1;
    #10;
    $display("A=%d B=%d y=%d",a,b,y);

    a=1;b=0;
    #10;
    $display("A=%d B=%d y=%d",a,b,y);

    a=1;b=1;
    #10;
    $display("A=%d B=%d y=%d",a,b,y);

end
    
endmodule