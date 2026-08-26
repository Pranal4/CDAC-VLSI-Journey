module tb_full_adder;

    reg  a, b, cin;
    wire sum, cout;

    full_adder_stru DUT (
        .a    ( a    ),
        .b    ( b    ),
        .cin  ( cin  ),
        .sum  ( sum  ),
        .cout ( cout )
    );

    initial begin
        $display("A  B  Cin  |  Sum  Cout");
        $display("------------------------");

        {a, b, cin} = 3'b000; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b001; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b010; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b011; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b100; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b101; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b110; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        {a, b, cin} = 3'b111; #10;
        $display("%b  %b   %b   |   %b     %b", a,b,cin,sum,cout);

        $finish;
    end

endmodule