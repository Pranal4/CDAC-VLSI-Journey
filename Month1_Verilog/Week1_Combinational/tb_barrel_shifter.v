module tb_barrel_shifter;

reg [3:0] data;
reg [1:0] shift;
wire [3:0] result;

barrel_shifter DUT(
    .data(data),
    .shift(shift),
    .result(result)
);

initial begin
    $dumpfile("barrel_shifter.vcd");
    $dumpvars(0, tb_barrel_shifter);

    // Test case 1: No shift
    data = 4'b1010; shift = 2'b00; #10;
    $display("Data: %b, Shift: %b, Result: %b", data, shift, result);

    // Test case 2: Shift left by 1
    data = 4'b1010; shift = 2'b01; #10;
    $display("Data: %b, Shift: %b, Result: %b", data, shift, result);

    // Test case 3: Shift left by 2
    data = 4'b1010; shift = 2'b10; #10;
    $display("Data: %b, Shift: %b, Result: %b", data, shift, result);

    // Test case 4: Shift left by 3
    data = 4'b1010; shift = 2'b11; #10;
    $display("Data: %b, Shift: %b, Result: %b", data, shift, result);

    // Test case 5: Default case (should not occur)
    data = 4'b1010; shift = 2'bxx; #10;
    $display("Data: %b, Shift: %b, Result: %b", data, shift, result);

    $finish;
end
    
endmodule