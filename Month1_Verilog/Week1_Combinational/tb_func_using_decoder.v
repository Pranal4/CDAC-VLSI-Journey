module tb_func_using_decoder;

reg a,b,c;
wire f;

func_using_decoder DUT(
    .a(a),
    .b(b),
    .c(c),
    .f(f)
);
    
initial begin
    $dumpfile("func_using_decoder.vcd");
    $dumpvars(0, tb_func_using_decoder);

    $display("A  B  C  |  F  |  C==F?");
    $display("------------------------");

    {a,b,c} = 3'b000; #10;
    $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

    {a,b,c} = 3'b001; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b010; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b011; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b100; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b101; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b110; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        {a,b,c} = 3'b111; #10;
        $display("%b  %b  %b  |  %b  |  %s", a,b,c,f, (f==c)?"YES":"NO");

        $finish;
end
endmodule