module tb_mux_4to1;
    
    reg [3:0] data;
    reg [1:0] sel;
    wire y;

    mux_4to1 DUT(
        .data(data),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux_4to1.vcd");
        $dumpvars(0, tb_mux_4to1);
        $display("SEL | DATA     | Y");
        $display("----+---------+--");

        data = 4'b1001; // 1 = I3, 0 = I2, 0 = I1, 1 = I0

        sel = 2'b00; #10;
        $display(" %b  | %b | %b  (expect I0=%b)", sel, data, y, data[0]);

        sel = 2'b01; #10;
        $display(" %b  | %b | %b  (expect I1=%b)", sel, data, y, data[1]);

        sel = 2'b10; #10;
        $display(" %b  | %b | %b  (expect I2=%b)", sel, data, y, data[2]);

        sel = 2'b11; #10;
        $display(" %b  | %b | %b  (expect I3=%b)", sel, data, y, data[3]);

        $display("----+---------+--");
        $display("Test Complete!");
        $finish;
    end
endmodule