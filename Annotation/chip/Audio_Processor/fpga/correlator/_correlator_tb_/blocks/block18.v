    assign normal = in[WIDTH-1] ? ~in : in;

    wire [(WIDTH-1):0] bit_1;
    wire [(WIDTH-1):0] bit_2;
    wire [(WIDTH-1):0] bit_4;
    wire [(WIDTH-1):0] bit_8;
    wire [(WIDTH-1):0] bit_16;
    wire [(WIDTH-1):0] bit_32;
    wire [(WIDTH-1):0] bit_64;

    assign bit_1  = normal | (normal >> 1);
    assign bit_2  = bit_1  | (bit_1 >> 2);
    assign bit_4  = bit_2  | (bit_2 >> 4);
    assign bit_8  = bit_4  | (bit_4 >> 8);
    assign bit_16 = bit_8  | (bit_8 >> 16);
    assign bit_32 = bit_16 | (bit_16 >> 32);
    assign bit_64 = bit_32 | (bit_32 >> 64);