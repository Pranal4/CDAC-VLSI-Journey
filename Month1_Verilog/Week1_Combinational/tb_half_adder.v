module tb_half_adder;

reg a, b;
wire sum, carry;

half_adder DUT(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    a=0;b=0;#10;
    $display("A=%b B=%b Sum=%b Carry=%b", a,b,sum,carry);

    a=0;b=1;#10;
    $display("A=%b B=%b Sum=%b Carry=%b", a,b,sum,carry);

    a=1;b=0;#10;
    $display("A=%b B=%b Sum=%b Carry=%b", a,b,sum,carry);

    a=1;b=1;#10;
    $display("A=%b B=%b Sum=%b Carry=%b", a,b,sum,carry);
    $finish;
end
    
endmodule