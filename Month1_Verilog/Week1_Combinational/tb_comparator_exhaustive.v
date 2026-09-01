module tb_comparator_exhaustive;

reg [3:0] a, b;
wire a_gt_b, a_eq_b, a_lt_b;

integer i, j;
integer errors = 0;

comparator_4bit DUT(
    .a(a), .b(b),
    .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b)
);

initial begin
    for (i = 0 ;i < 16 ; i = i + 1 ) begin
        for (j = 0; j < 16 ; j = j + 1 ) begin
            a = i; b = j;
            #5
            if ((a_gt_b !== (a > b)) ||
                (a_eq_b !== (a == b)) ||
                (a_lt_b !== (a < b)) ) begin
                    $display("Error at A=%0d B=%0d", a, b);
                    errors = errors + 1;
            end
        end
    end
    if (errors == 0) begin
        $display("All 256 combination Passed!");
    end else begin
        $display("%d ERRORS FOUND!", errors);
    end
     
    $finish;
end
    
endmodule