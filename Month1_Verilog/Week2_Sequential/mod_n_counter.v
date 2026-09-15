module mod_n_counter #(
    parameters N = 6
) (
    input wire clk, rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if(rst) count <= 4'b0000;
    else if (count == N-1) count <= 4'b0000;
    else count <= count + 1'b1;
end
    
endmodule