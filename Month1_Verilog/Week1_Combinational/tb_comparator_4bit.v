module tb_comparator_4bit;
    reg [3:0] a,b;
    wire a_gt_b, a_eq_b, a_lt_b;

    comparator_4bit DUT(
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_eq_b(a_eq_b),
        .a_lt_b(a_lt_b)
    );

    initial begin
        $dumpfile("comparator_4bit.vcd");
        $dumpvars(0, tb_comparator_4bit);

        a= 4'd5; b= 4'd3; #10;
        $display("A=%d B=%d GT=%b EQ=%b LT=%b", a, b, a_gt_b, a_eq_b, a_lt_b);

        a= 4'd7; b= 4'd7; #10;
        $display("A=%d B=%d GT=%b EQ=%b LT=%b", a, b, a_gt_b, a_eq_b, a_lt_b);

        a= 4'd1; b= 4'd12; #10;
        $display("A=%d B=%d GT=%b EQ=%b LT=%b", a, b, a_gt_b, a_eq_b, a_lt_b);

        a= 4'd0; b= 4'd0; #10;
        $display("A=%d B=%d GT=%b EQ=%b LT=%b", a, b, a_gt_b, a_eq_b, a_lt_b);

        a= 4'd15; b= 4'd13; #10;
        $display("A=%d B=%d GT=%b EQ=%b LT=%b", a, b, a_gt_b, a_eq_b, a_lt_b);
        $finish;
    end

endmodule