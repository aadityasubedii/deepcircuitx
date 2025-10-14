module out_i2s #(parameter DATA_WIDTH = 16) (
    input BCLK,
    input [(DATA_WIDTH - 1): 0] left_data,
    input [(DATA_WIDTH - 1): 0] right_data,
    input DACLRC,
    output reg DACDAT,
    output wire[5:0] debug
);

    // Internal register
    reg[5:0] bit_counter = 5'd0;
    reg prevDACLRC;

    assign debug = right_data[DATA_WIDTH - 1 - bit_counter];

    //DAC processing
    always @(negedge BCLK) begin
        if(bit_counter < DATA_WIDTH) begin  
            prevDACLRC = DACLRC;
            if(DACLRC) begin
                DACDAT = right_data[DATA_WIDTH - 1 - bit_counter];
            end else begin
                DACDAT = left_data[DATA_WIDTH - 1 - bit_counter];
            end
            bit_counter = bit_counter + 1;
        end else begin
            if(DACLRC != prevDACLRC) begin 
                bit_counter = 5'd0; 
                if(DACLRC) begin
                    DACDAT = right_data[DATA_WIDTH - 1 - bit_counter];
                end else begin
                    DACDAT = left_data[DATA_WIDTH - 1 - bit_counter];
                end
                bit_counter = bit_counter + 1; 
            end
        end
    end

   endmodule
