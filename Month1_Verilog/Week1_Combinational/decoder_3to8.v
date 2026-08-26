module decoder_3to8 (
    input wire [2:0] in,
    input wire en,
    output reg [7:0] out
);

always @(*) begin
    if (en) begin
        out = 8'b0000_0000;
        out[in] = 1'b1;
    end else begin
        out = 8'b0000_0000;
    end
end
    
endmodule