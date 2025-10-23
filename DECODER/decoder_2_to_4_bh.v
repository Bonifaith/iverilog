module decoder_2_to_4_bh (
    input [1:0] A, // 2-bit input
    input E, // Enable input
    output reg [3:0] Y // 4-bit output
);
always @(*) begin
    if (E == 1'b1) begin // Decoder enabled
    case (A)
    2'b00: Y = 4'b0001;
    2'b01: Y = 4'b0010;
    2'b10: Y = 4'b0100;
    2'b11: Y = 4'b1000;
    default: Y = 4'b0000; // For completeness, though not strictly necessary here
    endcase
end else begin // Decoder disabled
    Y = 4'b0000;
    end
end
endmodule