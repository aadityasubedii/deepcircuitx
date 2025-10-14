generate
    if(NUMBER_OF_COLOUR_PLANES == 1) begin
        assign count_sample = count_cycle;
        assign start_of_sample = 1'b1;
        assign sample_ticks = 1'b0;
    end else begin
        reg [LOG2_NUMBER_OF_COLOUR_PLANES-1:0] count_valids;
        wire new_sample;
        
        assign new_sample = count_valids == (NUMBER_OF_COLOUR_PLANES - 1);
        