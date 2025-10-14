module highest_bit
    #(parameter WIDTH=40, parameter LEVEL_W=$clog2(WIDTH))
   (input wire ck,
    input wire signed [(WIDTH-1):0] in,
    output reg [(LEVEL_W-1):0] out
);