module tb_mux_8to1;

reg [7:0] data;
reg [2:0] sel;
wire y;

mux_8to1 DUT(
    .data(data),
    .sel(sel),
    .y(y)
);

initial begin
    $dumpfile("mux_8to1.vcd");
    $dumpvars(0, tb_mux_8to1);

    data = 8'b10101010;

    sel = 3'b000; #10;
    $display("S=%b D=%b Y=%b (expect I0=%b)", sel, data, y, data[0]);

    sel = 3'b001; #10;
    $display("S=%b D=%b Y=%b (expect I1=%b)", sel, data, y, data[1]);

    sel = 3'b010; #10;
    $display("S=%b D=%b Y=%b (expect I2=%b)", sel, data, y, data[2]);

    sel = 3'b011; #10;
    $display("S=%b D=%b Y=%b (expect I3=%b)", sel, data, y, data[3]);

    sel = 3'b100; #10;
    $display("S=%b D=%b Y=%b (expect I4=%b)", sel, data, y, data[4]);

    sel = 3'b101; #10;
    $display("S=%b D=%b Y=%b (expect I5=%b)", sel, data, y, data[5]);

    sel = 3'b110; #10;
    $display("S=%b D=%b Y=%b (expect I6=%b)", sel, data, y, data[6]);

    sel = 3'b111; #10;
    $display("S=%b D=%b Y=%b (expect I7=%b)", sel, data, y, data[7]);
    $finish;
end
    
endmodule