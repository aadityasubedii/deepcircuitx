generate begin : write_buffer_generation
    genvar i;
    for(i = 0; i < NUMBER_OF_COLOUR_PLANES; i = i + 1) begin : write_buffer_generation_for_loop