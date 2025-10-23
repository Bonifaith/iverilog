`timescale 1ns/1ps

module decoder_2_to_4_tb;

    // Declare test signals
    reg A1, A0, E;          // Inputs to the decoder
    wire Y3, Y2, Y1, Y0;    // Outputs from the decoder

    // Instantiate the DUT (Device Under Test)
    decoder_2_to_4_df dut (
        .A1(A1),
        .A0(A0),
        .E(E),
        .Y3(Y3),
        .Y2(Y2),
        .Y1(Y1),
        .Y0(Y0)
    );

    // Dumpfile setup for waveform viewing
    initial begin
        $dumpfile("decoder_2_to_4.vcd");   // Name of VCD file to generate
        $dumpvars(0, decoder_2_to_4_tb);   // Dump all signals in this testbench
    end

    // Test procedure
    initial begin
        // Print header
        $display("Time\tE\tA1 A0\t|\tY3 Y2 Y1 Y0");
        $display("-----------------------------------");

        // Case 1: Decoder disabled
        E = 1; A1 = 0; A0 = 0; #10;
        $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);

        // Case 2: Enable decoder (E = 0), test all input combinations
        E = 0;
        A1 = 0; A0 = 0; #10; $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);
        A1 = 0; A0 = 1; #10; $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);
        A1 = 1; A0 = 0; #10; $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);
        A1 = 1; A0 = 1; #10; $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);

        // Case 3: Disable again
        E = 1; A1 = 1; A0 = 0; #10;
        $display("%0t\t%b\t%b  %b\t|\t%b  %b  %b  %b", $time, E, A1, A0, Y3, Y2, Y1, Y0);

        // Finish simulation
        $finish;
    end

endmodule
