module out_lj #(parameter DATA_WIDTH = 24) (
    input BCLK,
    input start,
    input [(DATA_WIDTH - 1): 0] left_data,
    input [(DATA_WIDTH - 1): 0] right_data,
    output reg DACLRC,
    output reg DACDAT,
    output reg data_ready
);

    // Internal register
    reg[5:0] bit_counter = 5'd0;
    reg running = 0;

    //DAC processing
    always @(posedge BCLK) begin
        if(start) begin
            running = 1;
            bit_counter = 5'd0;
            data_ready = 0;
        end
        if(running) begin
            DACLRC = bit_counter >= DATA_WIDTH;
            if(DACLRC)
                DACDAT = right_data[DATA_WIDTH + DATA_WIDTH - 1 - bit_counter];
            else
                DACDAT = left_data[DATA_WIDTH - 1 - bit_counter];
            bit_counter = bit_counter + 1;
            if(bit_counter == DATA_WIDTH<<1) begin
                running = 0;
                data_ready = 1;
            end
        end
    end

   endmodule
