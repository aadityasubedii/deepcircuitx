    assign sof = ws_0 & !ws;
    wire ext_okay;
    assign ext_okay = had_64_bits & sof;