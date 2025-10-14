    always @(posedge ce2cem) begin
        if (deep_power_down_exit !== 1'b1)
            $display ("%t ERROR:  tCEM violation on CE#", $realtime);
    end