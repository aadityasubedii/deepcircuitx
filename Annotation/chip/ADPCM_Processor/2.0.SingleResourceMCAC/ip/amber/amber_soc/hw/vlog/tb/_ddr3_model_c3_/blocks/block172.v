    task cmd_addr_timing_check;
    input i;
    reg [4:0] i;
    begin
        if (rst_n_in && prev_cke) begin
            if ((i == 0) && ($time - tm_ck_pos < TIH))	               
                $display ("%m: at time %t ERROR:  tIH violation on %s by %t", $time, cmd_addr_string[i], tm_ck_pos + TIH - $time);
            if ((i > 0) && (cs_n_in == 0) &&($time - tm_ck_pos < TIH)) 
                $display ("%m: at time %t ERROR:  tIH violation on %s by %t", $time, cmd_addr_string[i], tm_ck_pos + TIH - $time);
            if ($time - tm_cmd_addr[i] < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on %s by %t", $time, cmd_addr_string[i], tm_cmd_addr[i] + TIPW - $time);
        end
        tm_cmd_addr[i] = $time;
    end
    endtask
