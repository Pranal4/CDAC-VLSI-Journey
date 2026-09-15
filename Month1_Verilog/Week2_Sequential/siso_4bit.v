module siso_4bit (
    input wire clk, rst,
    input wire si,
    output wire so
);

reg [3:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) shift_reg <= 4'b0000;
    else shift_reg <= {shift_reg[2:0], si};
end
    
assign so = shift_reg[3];
endmodule