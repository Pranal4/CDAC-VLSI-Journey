module sipo_4bit (
    input wire clk, rst,
    input wire si,
    output wire [3:0]po
);

reg [3:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) shift_reg <= 4'b0000;
    else shift_reg <= {shift_reg[2:0], si};
end
    
assign po = shift_reg;
endmodule