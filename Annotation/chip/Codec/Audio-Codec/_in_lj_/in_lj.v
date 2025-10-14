module in_lj #(parameter DATA_WIDTH = 24) (
	input BCLK,
    input ADCDAT,
    input start,
	output reg ADCLRC,
    output reg data_ready,
    output reg[(DATA_WIDTH-1):0] left_data,
    output reg[(DATA_WIDTH-1):0] right_data,
    output wire[5:0] counter, //debug
    output wire[31:0] debug //debug
);

    // Internal registers
    reg[5:0] bit_counter = 5'd0;
    reg running = 0;

    //debug
    assign counter = bit_counter;
    assign debug = DATA_WIDTH + DATA_WIDTH - 1 - bit_counter;

    // ADC processing
    always @(posedge BCLK)
    begin
        if(start) begin
            running = 1;
            bit_counter = 5'd0;
            data_ready = 0;
        end
        if(running) begin
            ADCLRC = bit_counter >= DATA_WIDTH;        
            if(ADCLRC)
                right_data[DATA_WIDTH + DATA_WIDTH - 1 - bit_counter] = ADCDAT;
            else 
                left_data[DATA_WIDTH - 1 - bit_counter] = ADCDAT;
            if(!start)
                bit_counter = bit_counter + 1;
            if(bit_counter == DATA_WIDTH<<1) begin
                running = 0;
                data_ready = 1;
            end
        end
    end

endmodule
