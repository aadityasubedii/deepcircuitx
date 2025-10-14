module mux_4x1(
    input[3:0] i,
    input[1:0] s,
    output F
);
    wire s1neg, s0neg, T1, T2, T3, T4;

    not (s0neg, s[0]), (s1neg, s[1]);
    and (T1, i[0], s0neg, s1neg);
    and (T2, i[1], s0neg, s1);
    and (T3, i[2], s0, s1neg);
    and (T4, i[3], s0, s1);
    or(F, T1, T2, T3, T4);
endmodule
