module in_i2s #(parameter DATA_WIDTH = 16) (
	input BCLK,
    input ADCDAT,
	input ADCLRC,
    output reg signed[(DATA_WIDTH-1):0] out_left_data,
    output reg signed[(DATA_WIDTH-1):0] out_right_data,
    output wire[5:0] counter, //debug
    output wire[31:0] debug //debug
);

    // Internal registers
    reg[5:0] bit_counter = 5'd0;
    reg[(DATA_WIDTH-1):0] left_data;
    reg[(DATA_WIDTH-1):0] right_data;
    reg pClock = 1;
    reg prevADCLRC;

    //debug
    assign counter = bit_counter;
    assign debug = prevADCLRC;

    always @(negedge ADCLRC)
    begin
        out_right_data <= right_data;
    end 

    always @(posedge ADCLRC)
    begin
        out_left_data <= left_data;
    end 

    // ADC processing
    always @(negedge BCLK)
    begin
        if(bit_counter < DATA_WIDTH) begin  
            prevADCLRC = ADCLRC;    
            if(ADCLRC) begin
                right_data[DATA_WIDTH - 1 - bit_counter] = ADCDAT;
            end else begin 
                left_data[DATA_WIDTH - 1 - bit_counter] = ADCDAT;
            end
            bit_counter = bit_counter + 1;
        end else begin
            if(ADCLRC != prevADCLRC) bit_counter = 5'd0;
        end
    end

endmodule
