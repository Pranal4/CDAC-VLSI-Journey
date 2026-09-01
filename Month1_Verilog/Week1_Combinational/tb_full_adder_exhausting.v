module tb_full_adder_exh;
    
    reg a,b,cin;
    wire sum, cout;

    integer i;
    integer errors = 0;

    full_adder DUT(
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        for (i = 0 ; i < 8 ; i = i + 1 ) begin
            a = i[2]; b = i[1]; cin = i[0];
            #10;
            if ((sum !== (a ^ b ^ cin)) || (cout !== ((a & b) | (b & cin) | (a & cin)))) begin
                $display("ERROR at %b: a=%b b=%b cin=%b sum=%b cout=%b", i, a, b, cin, sum, cout);
                errors = errors + 1;
            end
        end
        if (errors == 0) begin
            $display(" ALL COMBINATION PASSED !");
        end else begin
            $display("%0d ERRORS FOUND! ", errors);
        end
        $finish;
    end
endmodule