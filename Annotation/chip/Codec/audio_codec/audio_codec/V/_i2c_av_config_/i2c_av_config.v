module i2c_av_config (
    input clk,
    input reset,

    output i2c_sclk,
    inout  i2c_sdat,

    output [3:0] status
);

reg [23:0] i2c_data;
reg [15:0] lut_data;
reg [3:0]  lut_index = 4'd0;

reg  i2c_start = 1'b0;
wire i2c_done;
wire i2c_ack;

i2c_controller control (
    .clk (clk),
    .i2c_sclk (i2c_sclk),
    .i2c_sdat (i2c_sdat),
    .i2c_data (i2c_data),
    .start (i2c_start),
    .done (i2c_done),
    .ack (i2c_ack)
);

always @(*) begin
    case (lut_index)
        4'h0: lut_data <= 16'h0c10; // power on everything except out
        4'h1: lut_data <= 16'h0080; // left ADC input volume, muted
        4'h2: lut_data <= 16'h0280; // right ADC input volume, muted
        4'h3: lut_data <= 16'h0479; // left DAC output volume, default
        4'h4: lut_data <= 16'h0679; // right DAC output volume, default
        4'h5: lut_data <= 16'h0816; // analog path, DAC enabled, mic disabled
        4'h6: lut_data <= 16'h0a00; // digital path, default
        4'h7: lut_data <= 16'h0e01; // digital IF, 16bit words, left-justified mode
        4'h8: lut_data <= 16'h100C; // sampling rate, 8khz, mclk = 12.288 mhz
        4'h9: lut_data <= 16'h0c00; // power on everything
        4'ha: lut_data <= 16'h1201; // activate
        default: lut_data <= 16'h0000;
    endcase
end

reg [1:0] control_state = 2'b00;

assign status = lut_index;

always @(posedge clk) begin
    if (reset) begin
        lut_index <= 4'd0;
        i2c_start <= 1'b0;
        control_state <= 2'b00;
    end else begin
        case (control_state)
            2'b00: begin
                i2c_start <= 1'b1;
                i2c_data <= {8'h34, lut_data};
                control_state <= 2'b01;
            end
            2'b01: begin
                i2c_start <= 1'b0;
                control_state <= 2'b10;
            end
            2'b10: if (i2c_done) begin
                if (i2c_ack) begin
                    if (lut_index == 4'ha)
                        control_state <= 2'b11;
                    else begin
                        lut_index <= lut_index + 1'b1;
                        control_state <= 2'b00;
                    end
                end else
                    control_state <= 2'b00;
            end
        endcase
    end
end

endmodule