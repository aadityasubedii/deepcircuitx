module i2s_dual
#(parameter DIVIDER=16, WIDTH=$clog2(DIVIDER)+1, DETECT=5)
(
    input wire ck,
    input wire rst,
    input wire ext_sck,
    input wire ext_ws,
    output wire sck,
    output wire ws,
    output wire en,
    output wire [5:0] frame_posn,
    output wire external
);

    
    wire local_en;
    wire local_sck;
    wire local_ws;
    wire [5:0] local_frame_posn;

    i2s_clock #(.DIVIDER(DIVIDER))
    i2s_clock(
        .ck(ck),
        .rst(rst),
        .en(local_en),
        .sck(local_sck),
        .ws(local_ws),
        .frame_posn(local_frame_posn)
    );

    
    wire ext_en;
    wire [5:0] ext_frame_posn;

    i2s_secondary #(.WIDTH(WIDTH))
    i2s_secondary(
        .ck(ck),
        .sck(ext_sck),
        .ws(ext_ws),
        .en(ext_en),
        .frame_posn(ext_frame_posn)
    );

    

    i2s_detect #(.WIDTH(DETECT))
    i2s_detect(
        .ck(ck),
        .ext_ws(ext_ws),
        .ext_frame_posn(ext_frame_posn),
        .local_frame_posn(local_frame_posn),
        .local_en(local_en),
        .valid(external)
    );

    
    assign sck          = external ? ext_sck        : local_sck;
    assign ws           = external ? ext_ws         : local_ws;
    assign en           = external ? ext_en         : local_en;
    assign frame_posn   = external ? ext_frame_posn : local_frame_posn;

endmodule