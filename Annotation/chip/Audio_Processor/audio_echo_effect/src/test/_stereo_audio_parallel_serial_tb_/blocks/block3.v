    task intake(input is_left, input reg [31:0] value);
        begin
            i_valid <= 1'b1;
            i_is_left <= is_left;
            i_audio <= value;
            @(posedge clk);
            if (!i_ready)
                wait (i_ready) @(posedge clk);
            intake_count++;
        end
    endtask