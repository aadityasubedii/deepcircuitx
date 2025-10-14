module shift
#(parameter IN_W=24, OUT_W=16, SHIFT=IN_W-OUT_W, SHIFT_W=$clog2(SHIFT))
(
    input wire ck,
    input wire [SHIFT_W-1:0] shift,
    input wire [IN_W-1:0] in,
    output wire [OUT_W-1:0] out
);