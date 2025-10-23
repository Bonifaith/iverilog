module decoder_2_to_4_st (A1, A0, E, Y3, Y2, Y1, Y0);
    input A1, A0, E;
    output Y3, Y2, Y1, Y0;

    wire not_A1, not_A0, not_E;
    wire and_0, and_1, and_2, and_3;

not (not_A1, A1);
not (not_A0, A0);
not (not_E, E);

and (and_0, not_A1, not_A0, not_E);
and (and_1, not_A1, A0, not_E);
and (and_2, A1, not_A0, not_E);
and (and_3, A1, A0, not_E);

assign Y0 = and_0;
assign Y1 = and_1;
assign Y2 = and_2;
assign Y3 = and_3;

endmodule