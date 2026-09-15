module t_from_dff (
    input wire clk, rst,
    input wire t,
    output wire q
);

wire d_input;
wire q_internal;

assign d_input = t ^ q_internal;

dff_async DFF_CORE(
    .clk(clk),
    .rst(rst),
    .d(d_input),
    .q(q_internal)
);
 
assign q = q_internal;
    
endmodule