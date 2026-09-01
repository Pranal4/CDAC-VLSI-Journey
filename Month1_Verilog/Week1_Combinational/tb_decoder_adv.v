
module tb_decoder_adv;

    reg [2:0] in;
    reg en;
    wire [7:0] out;

    integer i;
    integer errors = 0;
    integer ones;

    decoder_3to8 DUT(
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        en = 1;

        // Exhaustive test: 8 input combinations
        for (i = 0; i < 8; i = i + 1) begin

            in = i;
            #10;

            // Manual bit counting
            ones = out[0] + out[1] + out[2] + out[3] +
                   out[4] + out[5] + out[6] + out[7];

            // Check exactly ONE output is HIGH
            if (ones !== 1) begin
                $display("FAIL: IN=%b EN=%b OUT=%b -> %0d bits HIGH",
                         in, en, out, ones);
                errors = errors + 1;
            end

            // Check correct output bit is HIGH
            else if (out !== (8'b00000001 << i)) begin
                $display("FAIL: IN=%b EN=%b OUT=%b EXPECTED=%b",
                         in, en, out, (8'b00000001 << i));
                errors = errors + 1;
            end

            else begin
                $display("PASS: IN=%b EN=%b OUT=%b",
                         in, en, out);
            end

        end

        // Test decoder disabled
        en = 0;
        in = 3'b000;
        #10;

        if (out !== 8'b00000000) begin
            $display("FAIL: Decoder disabled OUT=%b", out);
            errors = errors + 1;
        end
        else begin
            $display("PASS: Decoder disabled OUT=%b", out);
        end

        // Final result
        if (errors == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("%0d ERRORS FOUND!", errors);

        $finish;

    end

endmodule

