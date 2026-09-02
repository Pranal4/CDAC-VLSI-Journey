module dff_enable (
    input wire clk,
    input wire rst,
    input wire d,
    input wire en,
    output reg q
);
    
    always @(posedge clk) begin
        if (rst) begin
            q <= 1'b0;
        end else if (en) begin
            q <= d;
        end
    end
endmodule