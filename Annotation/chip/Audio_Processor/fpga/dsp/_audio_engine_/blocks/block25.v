    always @(posedge ck) begin
        
        if (!allow_audio_writes) begin

            if (start_of_frame) begin
                chan_addr <= 0;
                writing <= 1;
                frame_counter <= frame_counter - 1;
            end else begin
                chan_addr <= chan_addr + 1;
            end

            
            if (writing && (chan_addr == (CHANNELS-1))) begin
                writing <= 0;
                frame_reset_req <= 1;
            end
            

            if (frame_reset_req)
                frame_reset_req <= 0;

        end
    end