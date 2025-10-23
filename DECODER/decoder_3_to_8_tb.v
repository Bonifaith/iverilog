`timescale 1ns/1ps

module decoder_3_to_8_tb;
    reg [2:0] A;
    reg E;
    wire [7:0] Y;

    // Instantiate DUT (change module name if needed)
    decoder_3_to_8_bh dut (.A(A), .E(E), .Y(Y));

    // Waveform output
    initial begin
        $dumpfile("decoder_3_to_8.vcd");
        $dumpvars(0, decoder_3_to_8_tb);
    end

    initial begin
        $display("Time\tE\tA2 A1 A0\t|\tY");
        $display("---------------------------------------");

        E = 1; A = 3'b000; #10;  // Disabled
        $display("%0t\t%b\t%b %b %b\t|\t%b", $time, E, A[2], A[1], A[0], Y);

        E = 0;
        repeat (8) begin
            #10;
            $display("%0t\t%b\t%b %b %b\t|\t%b", $time, E, A[2], A[1], A[0], Y);
            A = A + 1;
        end


        $finish;
    end
endmodule
