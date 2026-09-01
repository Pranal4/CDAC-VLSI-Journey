module tb_rca_4bit_complete;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    integer pass_count = 0;
    integer fail_count = 0;

    ripple_adder DUT(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    task check_result;
        input [3:0] exp_sum;
        input       exp_cout;
        begin
            if (sum === exp_sum && cout === exp_cout) begin
                $display("PASS: A=%0d B=%0d Cin=%b => Sum=%0d Cout=%b",
                          a, b, cin, sum, cout);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: A=%0d B=%0d Cin=%b => Got Sum=%0d Cout=%b, Expected Sum=%0d Cout=%b",
                          a, b, cin, sum, cout, exp_sum, exp_cout);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("rca4bit.vcd");
        $dumpvars(0, tb_rca_4bit_complete);

        // 1. NORMAL CASE
        a=4'd5; b=4'd3; cin=0; #10;
        check_result(4'd8, 1'b0);

        // 2. ZERO CASE   
        a=4'd0; b=4'd0; cin=0; #10;
        check_result(4'd0, 1'b0);

        // 3. BOUNDARY — max value
        a=4'd15; b=4'd0; cin=0; #10;
        check_result(4'd15, 1'b0);

        // 4. ALL-ONES CASE
        a=4'hF; b=4'hF; cin=1; #10;
        check_result(4'd15, 1'b1);   // 15+15+1=31 -> sum=15,cout=1

        // 5. OVERFLOW CASE
        a=4'd15; b=4'd1; cin=0; #10;
        check_result(4'd0, 1'b1);    // 15+1=16 -> sum=0, cout=1

        // 6. CARRY-IN PROPAGATION
        a=4'd0; b=4'd0; cin=1; #10;
        check_result(4'd1, 1'b0);

        // 7. RANDOM CASE
        a=4'd9; b=4'd6; cin=1; #10;
        check_result(4'd0, 1'b1);    // 9+6+1=16 -> sum=0,cout=1

        $display("========================================");
        $display("RESULTS: %0d PASSED, %0d FAILED",
                   pass_count, fail_count);
        if (fail_count == 0)
            $display("ALL TESTS PASSED! ✓");
        else
            $display("SOME TESTS FAILED! ✗ — Debug needed");
        $display("========================================");

        $finish;
    end

endmodule
    
