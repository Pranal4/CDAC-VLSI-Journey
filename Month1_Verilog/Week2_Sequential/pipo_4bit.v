module pipo_4bit (
    input wire clk, rst, load,
    input wire [3:0]pi,
    output reg [3:0]po
);

always @(posedge clk or posedge rst) begin
    if (rst) po <= 4'b0000;
    else if(load) po <= pi;
end
    
endmodule