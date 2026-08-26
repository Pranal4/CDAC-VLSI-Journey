module tb_decoder_3to8;
    
    reg [2:0] in;
    reg en;
    wire [7:0] out;

    decoder_3to8 DUT(
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        $dumpfile("decoder_3to8.vcd");
        $dumpvars(0, tb_decoder_3to8);

        en=0;in=3'b000;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b000;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b001;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b010;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b011;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b100;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b101;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b110;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);

        en=1;in=3'b111;#10;
        $display("EN=%b IN=%b OUT=%b", en, in, out);
        $finish;
        
    end
endmodule