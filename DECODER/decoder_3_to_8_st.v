module decoder_3_to_8_st (
    input A2, A1, A0, E,       // 3 inputs + Enable
    output Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0
);
    wire nA2, nA1, nA0, nE;

    // Invert inputs
    not (nA2, A2);
    not (nA1, A1);
    not (nA0, A0);
    not (nE, E);

    // AND gates for each output (decoder disabled when E=1)
    and (Y0, nA2, nA1, nA0, ~E);
    and (Y1, nA2, nA1, A0, ~E);
    and (Y2, nA2, A1, nA0, ~E);
    and (Y3, nA2, A1, A0, ~E);
    and (Y4, A2, nA1, nA0, ~E);
    and (Y5, A2, nA1, A0, ~E);
    and (Y6, A2, A1, nA0, ~E);
    and (Y7, A2, A1, A0, ~E);

endmodule
