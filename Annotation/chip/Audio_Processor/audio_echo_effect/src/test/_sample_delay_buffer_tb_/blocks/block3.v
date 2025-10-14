    task out_data(input [audio_width-1:0] audio);
        begin
            i_valid <= 1'b1;
            i_audio <= audio;
            wait (i_ready) @(posedge clk);
            i_valid <= 1'b0;
            @(posedge clk);
        end
    endtask