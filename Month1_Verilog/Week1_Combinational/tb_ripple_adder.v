module tb_ripple_adder;

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

ripple_adder DUT(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
        $dumpfile("ripple_adder.vcd");
        $dumpvars(0, tb_ripple_adder);
        $display("A    +  B    + Cin = Cout Sum");
        $display("------------------------------");

        // Normal addition
        a=4'd5;  b=4'd3;  cin=0; #10;
        $display("%0d   +  %0d   +  %b  =  %b   %0d", a,b,cin,cout,sum);

        // Larger numbers
        a=4'd9;  b=4'd6;  cin=0; #10;
        $display("%0d   +  %0d   +  %b  =  %b   %0d", a,b,cin,cout,sum);

        // With carry in
        a=4'd7;  b=4'd7;  cin=1; #10;
        $display("%0d   +  %0d   +  %b  =  %b   %0d", a,b,cin,cout,sum);

        // Overflow: 15+1=16 (cout=1, sum=0)
        a=4'd15; b=4'd1;  cin=0; #10;
        $display("%0d  +  %0d   +  %b  =  %b   %0d  (overflow!)", a,b,cin,cout,sum);

        // All ones: 15+15+1=31
        a=4'hF;  b=4'hF;  cin=1; #10;
        $display("%0d  +  %0d  +  %b  =  %b   %0d", a,b,cin,cout,sum);
        $finish;
end
    
endmodule