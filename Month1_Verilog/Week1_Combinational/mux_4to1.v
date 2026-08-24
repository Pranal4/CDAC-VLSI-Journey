module mux_4to1 (
    input wire [3:0] data,
    input wire [1:0] sel,
    output reg y
);
    always @(*) begin
        case (sel)
            2'b00: y = data[0];
            2'b01: y = data[1];
            2'b10: y = data[2];
            2'b11: y = data[3]; 
            default: y = 1'b0;
        endcase
    end
endmodule