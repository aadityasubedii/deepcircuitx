    always @(posedge ck) begin

        if (en) begin
            
            address <= 0;
            find_max <= 1;
            max_in <= 0;
        end

        find_normal <= find_max;

        if (level_en) begin
            level_en <= 0;
            gain_wait <= 1;
        end

        if (gain_wait & level_ready) begin
            gain_en <= 1;
            gain_wait <= 0;
        end

        if (gain_en) begin
            gain_en <= 0;
        end

        if (gain_ready & gain_wait) begin
            gain_wait <= 0;
        end

        if (find_normal) begin
            
            if (normal > max_in) begin
                max_in <= normal;
            end
            if ((address == CHANS-1) && !find_max) begin
                
                
                level_en <= 1;
            end
        end

        
        
        if (find_max && !level_en) begin

            if (address != CHANS-1) begin
                
                address <= address + 1;
            end else begin
                find_max <= 0;
            end

        end
    end