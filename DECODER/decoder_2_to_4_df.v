module decoder_2_to_4_df (A1, A0, E, Y3, Y2, Y1, Y0);
    input A1, A0, E;
    output Y3, Y2, Y1, Y0;

assign Y0 = (~A1 & ~A0 & ~E);
assign Y1 = (~A1 & A0 & ~E);
assign Y2 = (A1 & ~A0 & ~E);
assign Y3 = (A1 & A0 & ~E);

endmodule