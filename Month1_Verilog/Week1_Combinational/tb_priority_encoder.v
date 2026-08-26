module tb_priority_encoder;

reg [3:0] in;
wire [1:0] out;
wire valid;

priority_encoder DUT(
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $dumpfile("priority_encoder.vcd");
    $dumpvars(0, tb_priority_encoder);

    in = 4'b0001; #10;
    $display("IN=%b OUT=%b VALID=%b (I0 active)",in, out, valid);

    in = 4'b0010; #10;
    $display("IN=%b OUT=%b VALID=%b (I1 active)",in, out, valid);

    in = 4'b0100; #10;
    $display("IN=%b OUT=%b VALID=%b (I2 active)",in, out, valid);

    in = 4'b1000; #10;
    $display("IN=%b OUT=%b VALID=%b (I3 active)",in, out, valid);

    in = 4'b0101; #10;
    $display("IN=%b OUT=%b VALID=%b",in, out, valid);

    in = 4'b1001; #10;
    $display("IN=%b OUT=%b VALID=%b",in, out, valid);
    $finish;
end
    
endmodule