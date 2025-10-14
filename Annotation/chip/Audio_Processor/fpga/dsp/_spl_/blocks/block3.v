module level 
#(parameter IN_W=24, BITS = $clog2(IN_W))
(
    input wire ck,
    input wire en,
    input wire [IN_W-1:0] in,
    output wire [BITS-1:0] level,
    output wire ready
);