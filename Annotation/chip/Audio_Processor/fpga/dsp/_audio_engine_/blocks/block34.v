    wire i2s_in_sample;
    wire i2s_out_sample;
    reg [3:0] i2s_in_offset = 0;
    reg [3:0] i2s_out_offset = 0;

    i2s_offset #(.WIDTH(4))
    i2s_offset_in(
        .ck(ck),
        .i2s_en(i2s_en),
        .offset(i2s_in_offset),
        .en(i2s_in_sample)
    );
