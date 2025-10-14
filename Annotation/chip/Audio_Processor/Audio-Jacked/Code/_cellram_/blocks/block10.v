    always @(posedge tow_check) begin
        if (!oe_n) begin
            if (dq_in !== {DQ_BITS{1'bz}})
                $display ("%t ERROR:  tOW violation on DQ", $realtime);
        end
        tow_check <= 1'b0;
    end