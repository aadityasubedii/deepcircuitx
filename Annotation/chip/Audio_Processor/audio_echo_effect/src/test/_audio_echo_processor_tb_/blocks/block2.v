    task out_data(input [audio_width-1:0] left, input [audio_width-1:0] right);
        begin
            i_valid <= 1'b1;
            i_left <= left;
            i_right <= right;
            wait (i_ready) @(posedge clk);
            i_valid <= 1'b0;
            @(posedge clk);
        end
    endtask