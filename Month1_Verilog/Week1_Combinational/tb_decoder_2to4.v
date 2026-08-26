module tb_decoder_2to4;

reg [1:0] in;
reg en;
wire [3:0] out;

decoder_2to4 DUT(
    .in(in),
    .en(en),
    .out(out)
);  

initial begin
    $dumpfile("decoder_2to4.vcd");
    $dumpvars(0, tb_decoder_2to4);

    en=0;in=2'b00; #10;
    $display("EN=%b IN=%b OUT=%b", en, in, out);

    en=1;in=2'b00; #10;
    $display("EN=%b IN=%b OUT=%b", en, in, out);

    en=1;in=2'b01; #10;
    $display("EN=%b IN=%b OUT=%b", en, in, out);

    en=1;in=2'b10; #10;
    $display("EN=%b IN=%b OUT=%b", en, in, out);

    en=1;in=2'b11; #10;
    $display("EN=%b IN=%b OUT=%b", en, in, out);
    $finish;
end

endmodule