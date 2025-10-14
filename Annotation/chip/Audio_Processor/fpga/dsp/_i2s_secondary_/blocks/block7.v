module i2s_detect
#(parameter WIDTH=5)
(
    input wire ck,
    input wire ext_ws,
    input wire [5:0] ext_frame_posn,
    input wire local_en,
    input wire [5:0] local_frame_posn,
    output wire valid
);