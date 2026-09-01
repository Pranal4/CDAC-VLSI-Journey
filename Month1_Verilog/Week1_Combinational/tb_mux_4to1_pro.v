module tb_mux_4to1_pro;

reg [3:0] data;
reg [1:0] sel;
wire y;

mux_4to1 DUT(
    .data(data),
    .sel(sel),
    .y(y)
);

integer pass_count = 0;
integer fail_count = 0;
integer i;

task check_y;
    input exp_data;
    begin
        if (y === exp_data) begin
            $display("PASS: SEL= %b DATA= %b Y= %b ", sel, data, y);
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL SEL=%b",sel);
            fail_count = fail_count + 1;
        end
    end
endtask

initial begin

    $dumpfile("m_pro.vcd");
    $dumpvars(0, tb_mux_4to1_pro);

    for ( i=0 ;i < 16 ; i = i + 1 ) begin
        data = i;
        sel=2'b00;#10;
        check_y(data[sel]);

        sel=2'b01;#10;
        check_y(data[sel]);

        sel=2'b10;#10;
        check_y(data[sel]);

        sel=2'b11;#10;
        check_y(data[sel]);

    end

    $display("--------------------------------");
    $display("TOTAL PASS = %0d", pass_count);
    $display("TOTAL FAIL = %0d", fail_count);
    $display("--------------------------------");

    $finish;
end
    
endmodule