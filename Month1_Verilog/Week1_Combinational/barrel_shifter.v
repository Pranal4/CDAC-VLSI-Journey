module barrel_shifter (
    input wire [3:0] data,
    input wire [1:0] shift,
    output reg [3:0] result
);

always @(*) begin
    case (shift)
        2'b00: result = data; // No shift
        2'b01: result = data << 1;
        2'b10: result = data << 2;
        2'b11: result = data << 3;
        default: result = data; // Default case
    endcase
end
    
endmodule