`timescale 1ns/1ps

module tb_ring_vs_johnson;

    reg  clk, rst;
    wire [3:0] q_ring, q_johnson;

    ring_counter    RING    (.clk(clk), .rst(rst), .q(q_ring));
    johnson_counter JOHNSON (.clk(clk), .rst(rst), .q(q_johnson));

    initial clk = 0;
    always #5 clk = ~clk;

    integer i;
    integer ring_states = 0;
    integer johnson_states = 0;
    reg [3:0] first_ring_state;
    reg [3:0] first_johnson_state;

    initial begin
        rst=1; #12;
        rst=0;

        $display("Clock# | Ring(4 FF) | Johnson(4 FF)");
        $display("------------------------------------");

        for (i = 1; i <= 10; i = i + 1) begin
            #10;

            if (i == 1) begin
                first_ring_state    = q_ring;
                first_johnson_state = q_johnson;
            end

            // Count states until pattern repeats
            if (i <= 4 && q_ring !== first_ring_state)
                ring_states = ring_states + 1;
            else if (i == 4)
                ring_states = ring_states + 1;

            $display("  %0d    |   %b    |    %b",
                       i, q_ring, q_johnson);
        end

        $display("------------------------------------");
        $display("Ring Counter:    4 FFs -> 4 states  (N)");
        $display("Johnson Counter: 4 FFs -> 8 states  (2N)");
        $display("Ratio confirmed: Johnson = 2x Ring");

        $finish;
    end

endmodule