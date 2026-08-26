module func_using_decoder (
    input wire a, b, c,
    output wire f
);

wire [7:0] dec_out;

decoder_3to8 DEC(
    .in({a,b,c}),
    .en(1'b1),
    .out(dec_out)
);

assign f = dec_out[1] | dec_out[3] | dec_out[5] | dec_out[7];
    
endmodule