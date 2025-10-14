always @(posedge clk) begin
    if (sample_end) begin
        last_sample <= audio_input;
    end

    if (sample_req) begin
        if (control[FEEDBACK])
            dat <= last_sample * volume_control;
        else if (control[SINE]) begin
            dat <= romdata[index];
            if (index == 7'd99)
                index <= 7'd00;
            else
                index <= index + 1'b1;
        end else
            dat <= 16'd0;
    end
end