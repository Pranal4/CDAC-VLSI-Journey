module tb_not_gate;

reg a;

wire y;

not_gate DUT(
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("not_gate.vcd");
    $dumpvars(0,tb_not_gate);

    a=0;
    #10;
    $display("A=%d Y=%d",a,y);

    a=1;
    #10;
    $display("A=%d Y=%d",a,y);

    $finish;
end

    
endmodule